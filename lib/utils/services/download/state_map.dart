import 'package:chapturn_sources/chapturn_sources.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'controller.dart';

part 'state_map.freezed.dart';

typedef DownloadStateMap = Map<Chapter, ChapterDownloadState>;

@freezed
class ChapterDownloadState with _$ChapterDownloadState {
  const factory ChapterDownloadState.skip() = ChapterDownloadSkip;
  const factory ChapterDownloadState.pending() = ChapterDownloadPending;
  const factory ChapterDownloadState.downloading() = ChapterDownloading;
  const factory ChapterDownloadState.complete() = ChapterDownloadComplete;
  const factory ChapterDownloadState.error(String reason) =
      ChapterDownloadError;
}

class DownloadStateMapNotifier extends StateNotifier<DownloadStateMap> {
  DownloadStateMapNotifier(DownloadStateMap state) : super(state);

  void setDownloadState(Chapter chapter, ChapterDownloadState downloadState) {
    state = {...state, chapter: downloadState};
  }

  void setMultipleDownloadStates(
      Iterable<Chapter> chapters, ChapterDownloadState downloadState) {
    final entries = Map.fromEntries(
      chapters.map((chapter) => MapEntry(chapter, downloadState)),
    );

    state = {...state, ...entries};
  }

  void remove(Chapter chapter) {
    state = Map.fromEntries(
      state.entries.takeWhile((entry) => entry.key != chapter),
    );
  }
}
