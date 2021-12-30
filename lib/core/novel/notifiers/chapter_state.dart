import 'package:chapturn_sources/chapturn_sources.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'chapter_state.freezed.dart';

enum ChapterDownloadState {
  pending,
  unselected,
  inProgress,
  complete,
}

@freezed
class ChapterState with _$ChapterState {
  const ChapterState._();

  const factory ChapterState(
    Chapter chapter, {
    @Default(ChapterDownloadState.pending) ChapterDownloadState downloadState,
    @Default(true) bool isSelected,
  }) = _ChapterState;

  ChapterDownloadState get downloadDisplayState {
    if (chapter.content != null) {
      return ChapterDownloadState.complete;
    } else if (!isSelected) {
      return ChapterDownloadState.unselected;
    }

    return downloadState;
  }

  bool get shouldDownload => isSelected && chapter.content == null;

  ChapterState copy({
    ChapterDownloadState? downloadState,
    bool? isSelected,
  }) {
    return ChapterState(
      chapter,
      downloadState: downloadState ?? this.downloadState,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class ChapterNotifier extends StateNotifier<ChapterState> {
  ChapterNotifier(ChapterState state) : super(state);

  void toggle(bool? value) {
    state = state.copy(isSelected: value ?? true);
  }
}
