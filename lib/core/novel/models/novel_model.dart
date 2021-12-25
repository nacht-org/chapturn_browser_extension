import 'package:chapturn_browser_extension/utils/helpers/text_helper.dart';
import 'package:chapturn_browser_extension/utils/helpers/web_helper.dart';
import 'package:chapturn_browser_extension/utils/services/package_service.dart';
import 'package:chapturn_sources/chapturn_sources.dart';
import 'package:chapturn_sources/interfaces/interfaces.dart';
import 'package:chapturn_sources/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../alert/models/alert_model.dart';
import 'chapter_model.dart';
import 'volume_model.dart';

enum NovelModelState {
  loading,
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

  @override
  List<Object?> get props => [message, error];
}

class NovelModel extends ChangeNotifier {
  Meta? meta;
  NovelCrawler? _crawler;
  bool isLoading = true;

  String url;
  Novel? novel;

  int value = 0;
  int total = 0;
  Map<int, VolumeModel> volumes = {};

  bool isDownloading = false;

  PackagingState packagingState = const PackagingState.idle();

  AlertModel alert;
  Packager packager;

  NovelModel(this.url, this.alert, {required this.packager}) {
    var tuple = crawlerByUrl(url);
    if (tuple == null) {
      return;
    }

    meta = tuple.item1();
    _crawler = tuple.item2();
  }

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
    if (isLoading) {
      return NovelModelState.loading;
    } else if (isDownloading) {
      return NovelModelState.downloading;
    } else if (!isSupported) {
      return NovelModelState.notSupported;
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

  /// Retrieve novel information
  Future<void> loadNovel() async {
    if (_crawler == null) {
      return;
    }

    novel = await _crawler!.parseNovel(url);
    if (novel != null) {
      volumes = Map.fromEntries(
        novel!.volumes.map((v) => MapEntry(v.index, VolumeModel(v))),
      );
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> loadNovelChecked() async {
    if (!hasData) {
      await loadNovel();
    }

    print(novel);
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
    packagingState = PackagingState.waiting();

    if (isDownloading) {
      alert.showAlert('Another task already running');
      packagingState = const PackagingState.idle();
      return;
    }

    if (novel == null) {
      print('Error: novel is null');
      return;
    }

    await waitDownload(showAlert: false);
    packagingState = const PackagingState.busy();

    var bytes = await packager.package(novel!);
    if (bytes == null) {
      alert.showAlert('Failed to package: null');
      return;
    }

    alert.showAlert('Packaged to epub');
    downloadFile(slugify(novel!.title) + '.epub', bytes);
    packagingState = const PackagingState.idle();
  }
}
