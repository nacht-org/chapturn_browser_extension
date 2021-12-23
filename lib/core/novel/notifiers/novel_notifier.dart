import 'package:chapturn_browser_extension/core/novel/notifiers/chapter_notifier.dart';
import 'package:chapturn_browser_extension/core/novel/notifiers/volume_notifier.dart';
import 'package:chapturn_sources/chapturn_sources.dart';
import 'package:chapturn_sources/interfaces/interfaces.dart';
import 'package:chapturn_sources/models/models.dart';
import 'package:flutter/material.dart';

enum NovelNotifierState {
  loading,
  idle,
  downloading,
  notSupported,
}

class NovelNotifier extends ChangeNotifier {
  Meta? meta;
  NovelCrawler? _crawler;
  bool isLoading = true;

  String url;
  Novel? novel;

  int value = 0;
  int total = 0;
  List<VolumeNotifier> volumes = [];
  bool isDownloading = false;

  NovelNotifier(this.url) {
    var tuple = crawlerByUrl(url);
    if (tuple == null) {
      return;
    }

    meta = tuple.item1();
    _crawler = tuple.item2();
  }

  /// Novel is null
  bool get hasData {
    return novel != null;
  }

  /// Has a source and the source supports browser
  bool get isSupported {
    return meta != null &&
        (meta!.support == Support.full || meta!.support == Support.browserOnly);
  }

  /// Has novel information and all chapter content
  bool get isDownloaded {
    return novel != null && volumes.every((v) => v.isDownloaded);
  }

  NovelNotifierState get state {
    if (isLoading) {
      return NovelNotifierState.loading;
    } else if (isDownloading) {
      return NovelNotifierState.downloading;
    } else if (!isSupported) {
      return NovelNotifierState.notSupported;
    } else {
      return NovelNotifierState.idle;
    }
  }

  List<ChapterNotifier> get pendingDownload {
    return [
      for (var chapters in volumes.map((e) => e.pendingDownload)) ...chapters
    ];
  }

  int get chaptersLength {
    if (volumes.isEmpty) {
      return 0;
    }

    return volumes
        .map((e) => e.chapters.length)
        .reduce((value, element) => value + element);
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
    if (isDownloaded) {
      return;
    }

    if (_crawler == null) {
      print('Download called when crawler was null');
      return;
    }

    isDownloading = true;
    var pending = pendingDownload;

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
}
