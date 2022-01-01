import 'package:chapturn_sources/chapturn_sources.dart';

import '../../../core/novel/notifiers/download_notifier.dart';

class ChapterState {
  final Volume volume;
  final Chapter chapter;
  final bool isSelected;

  ChapterState(
    this.volume,
    this.chapter, {
    this.isSelected = true,
  });

  ChapterDownloadState downloadDisplayState(ChapterDownloadState state) {
    if (chapter.content != null) {
      return ChapterDownloadState.complete;
    } else if (!isSelected) {
      return ChapterDownloadState.unselected;
    }

    return state;
  }

  bool get shouldDownload => isSelected && chapter.content == null;

  ChapterState copyWith({
    Volume? volume,
    Chapter? chapter,
    bool? isSelected,
  }) {
    return ChapterState(
      volume ?? this.volume,
      chapter ?? this.chapter,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
