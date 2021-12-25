import 'package:chapturn_sources/chapturn_sources.dart';
import 'package:chapturn_sources/interfaces/interfaces.dart';
import 'package:chapturn_sources/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../alert/notifiers/alert_model.dart';
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
  List<VolumeNotifier> volumes = [];
  bool isDownloading = false;

  PackagingState packagingState = const PackagingState.idle();

  AlertModel alert;

  NovelModel(this.url, this.alert) {
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
    return novel != null && volumes.every((v) => v.isDownloaded);
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

  List<ChapterNotifier> pendingDownload() {
    return [
      for (var chapters in volumes.map((e) => e.pendingDownload())) ...chapters
    ];
  }

  int get chapterCount {
    if (novel == null) {
      return 0;
    }

    return novel!.chapterCount();
  }

  /// Retrieve novel information
  Future<void> loadNovel() async {
    if (_crawler == null) {
      return;
    }

    novel = await _crawler!.parseNovel(url);
    if (novel != null) {
      volumes = novel!.volumes.map((v) => VolumeNotifier(v)).toList();
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
  Future<void> waitDownload() async {
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
  }

  Future<void> packEpub() async {
    packagingState = PackagingState.waiting();

    if (isDownloading) {
      alert.showAlert('Another task already running');
      packagingState = PackagingState.idle();
      return;
    }

    await waitDownload();
    packagingState = PackagingState.busy();
    // package
    packagingState = PackagingState.idle();
  }
}
