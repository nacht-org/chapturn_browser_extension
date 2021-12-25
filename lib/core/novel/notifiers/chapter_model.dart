import 'package:chapturn_sources/interfaces/interfaces.dart';
import 'package:chapturn_sources/models/models.dart';
import 'package:flutter/material.dart';

enum ChapterDownloadState {
  pending,
  unselected,
  inProgress,
  complete,
}

class ChapterModel extends ChangeNotifier {
  Volume volume;
  Chapter chapter;

  ChapterDownloadState state = ChapterDownloadState.pending;
  bool selected = true;

  ChapterModel(this.volume, this.chapter);

  ChapterDownloadState get tileState {
    if (chapter.content != null) {
      return ChapterDownloadState.complete;
    } else if (!selected) {
      return ChapterDownloadState.unselected;
    }

    return state;
  }

  /// If chapter is selected and has not content
  bool get shouldDownload {
    return selected == true && chapter.content == null;
  }

  /// Download and set chapters content
  ///
  /// Does not check for existng content
  Future<void> download(NovelCrawler crawler) async {
    state = ChapterDownloadState.inProgress;
    notifyListeners();

    await crawler.parseChapter(chapter);
    state = chapter.content != null
        ? ChapterDownloadState.complete
        : ChapterDownloadState.pending;
  }

  void select(bool? value) {
    selected = value ?? false;
    notifyListeners();
  }
}
