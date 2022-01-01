import 'package:chapturn_sources/chapturn_sources.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../chapter/models.dart';

part 'list.freezed.dart';

typedef DownloadList = List<DownloadItem>;

class DownloadItem {
  final NovelCrawler crawler;
  final ChapterState chapterState;

  DownloadItem(this.crawler, this.chapterState);
}

@freezed
class DownloadState with _$DownloadState {
  const factory DownloadState.empty() = DownloadEmpty;
  const factory DownloadState.pending(Iterable<ChapterState> pending) =
      DownloadPending;
  const factory DownloadState.downloading(int value) = Downloading;
  const factory DownloadState.complete() = DownloadComplete;
}

/// [bool] is used as state as we only need to indicate
/// when state has changed
class DownloadListController extends StateNotifier<bool> {
  DownloadListController(this.downloadList) : super(true);

  final DownloadList downloadList;

  void add(NovelCrawler crawler, ChapterState chapterState) {
    downloadList.add(DownloadItem(crawler, chapterState));
    state = !state;
  }

  void addAll(NovelCrawler crawler, Iterable<ChapterState> chapterStates) {
    downloadList.addAll(
      chapterStates.map((chapterState) => DownloadItem(crawler, chapterState)),
    );
    state = !state;
  }

  void remove(DownloadItem item) {
    downloadList.remove(item);
    state = !state;
  }

  void clear({bool update = true}) {
    downloadList.clear();
    if (update) {
      state = !state;
    }
  }
}
