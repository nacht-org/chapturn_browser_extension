import 'dart:typed_data';

import 'package:chapturn_sources/chapturn_sources.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

import '../../../utils/helpers/text_helper.dart';
import '../../../utils/helpers/io_helper/io_helper.dart';
import '../../../utils/services/browser_service/browser_service.dart';
import '../../../utils/services/package_service.dart';
import '../../alert/models/alert_model.dart';
import 'chapter_model.dart';
import 'volume_model.dart';

enum NovelModelState {
  loading,
  fetching,
  idle,
  downloading,
  notSupported,
}

class PackagingState extends Equatable {
  final String message;
  final bool error;

  const PackagingState(this.message, this.error);
  const PackagingState.idle() : this('Idle', false);
  const PackagingState.waiting() : this('Waiting', false);
  const PackagingState.busy() : this('Busy', false);
  const PackagingState.thumbnail() : this('Thumbnail', false);

  @override
  List<Object?> get props => [message, error];
}

class ContentIndex {
  final int volumeIndex;
  final int? chapterIndex;

  const ContentIndex(this.volumeIndex, [this.chapterIndex]);

  bool get isChapter => chapterIndex != null;
}

class NovelModel extends ChangeNotifier {
  String? url;
  Meta? meta;
  NovelCrawler? _crawler;
  bool isFetching = true;

  Novel? novel;

  int value = 0;
  int total = 0;
  Map<int, VolumeModel> volumes = {};
  List<ContentIndex> flat = [];

  bool isDownloading = false;

  PackagingState packagingState = const PackagingState.idle();

  final AlertModel alert;
  final Packager packager;
  final BrowserService browser;

  NovelModel({
    required this.alert,
    required this.packager,
    required this.browser,
  });

  /// Novel is null
  bool get hasData => novel != null;

  /// Has a source and the source supports browser
  bool get isSupported {
    return meta != null &&
        (meta!.support == Support.full || meta!.support == Support.browserOnly);
  }

  /// Has novel information and all chapter content
  bool get isDownloaded {
    return novel != null && volumes.values.every((v) => v.isDownloaded);
  }

  NovelModelState get state {
    if (url == null) {
      return NovelModelState.loading;
    } else if (!isSupported) {
      return NovelModelState.notSupported;
    } else if (isFetching) {
      return NovelModelState.fetching;
    } else if (isDownloading) {
      return NovelModelState.downloading;
    } else {
      return NovelModelState.idle;
    }
  }

  List<ChapterModel> pendingDownload() {
    return [
      for (var chapters in volumes.values.map((e) => e.pendingDownload()))
        ...chapters
    ];
  }

  int get chapterCount {
    if (novel == null) {
      return 0;
    }

    return novel!.chapterCount();
  }

  void select(int volumeIndex, int chapterIndex, bool? newValue) {
    volumes[volumeIndex]?.chapters[chapterIndex]?.selected = newValue ?? false;
    notifyListeners();
  }

  Future<void> load() async {
    url = await browser.href;
    var item = crawlerByUrl(url!);
    if (item == null) {
      notifyListeners();
      return;
    }

    meta = item.meta();
    _crawler = item.create();
    notifyListeners();

    if (isSupported) {
      loadNovel();
    }
  }

  /// Retrieve novel information
  Future<void> loadNovel() async {
    if (_crawler == null) {
      return;
    }

    novel = await _crawler!.parseNovel(url!);

    if (novel != null) {
      final entries = <MapEntry<int, VolumeModel>>[];
      for (var volume in novel!.volumes) {
        entries.add(MapEntry(volume.index, VolumeModel(volume)));
        flat.add(ContentIndex(volume.index));
        flat.addAll(volume.chapters.map(
          (chapter) => ContentIndex(volume.index, chapter.index),
        ));
      }

      volumes = Map.fromEntries(entries);
    }

    isFetching = false;
    notifyListeners();
  }

  Future<void> reloadNovel() async {
    novel = null;
    isFetching = true;
    notifyListeners();

    await loadNovel();
  }

  /// Download all chapter content if not already done so
  Future<void> waitDownload({bool showAlert = true}) async {
    if (_crawler == null) {
      print('Download called when crawler was null');
      return;
    }

    isDownloading = true;
    var pending = pendingDownload();
    if (pending.isEmpty) {
      isDownloading = false;
      return;
    }

    value = 1;
    total = pending.length;
    notifyListeners();

    for (var c in pending) {
      if (!c.shouldDownload) {
        continue;
      }

      await c.download(_crawler!);

      value++;
      notifyListeners();
    }

    isDownloading = false;
    notifyListeners();

    if (showAlert) alert.showAlert('Download completed');
  }

  Future<void> packEpub() async {
    await _packEpub();
    packagingState = const PackagingState.idle();
    notifyListeners();
  }

  Future<void> _packEpub() async {
    packagingState = const PackagingState.waiting();

    if (isDownloading) {
      alert.showAlert('Another task already running');
      return;
    }

    if (novel == null) {
      alert.showAlert('Failed to package: novel is null');
      return;
    }

    await waitDownload(showAlert: false);

    // download thumbnail
    Uint8List? thumbnailBytes;
    if (novel!.thumbnailUrl != null) {
      packagingState = const PackagingState.thumbnail();
      notifyListeners();

      final response = await http.get(Uri.parse(novel!.thumbnailUrl!));
      thumbnailBytes = response.bodyBytes;
    }

    packagingState = const PackagingState.busy();
    notifyListeners();

    List<int>? bytes;
    try {
      bytes = await packager.package(novel!, thumbnailBytes: thumbnailBytes);
    } catch (e) {
      if (e is XmlParserException) {
        alert.showAlert('Error parsing downloaded content: $e');
      } else {
        alert.showAlert('Failed to package');
      }
      return;
    }

    if (bytes == null) {
      alert.showAlert('Failed to package: epub is null');
      return;
    }

    alert.showAlert('Packaged to epub');
    downloadFile(slugifyMinimal(novel!.title) + '.epub', bytes);
  }
}
