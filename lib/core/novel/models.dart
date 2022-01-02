import 'package:chapturn_browser_extension/core/novel/controllers/download_controller.dart';
import 'package:chapturn_sources/chapturn_sources.dart';

class ChapterState {
  final Volume volume;
  final Chapter chapter;
  final bool isSelected;
  final ChapterDownloadState downloadState;

  ChapterState(
    this.volume,
    this.chapter, {
    this.isSelected = true,
    this.downloadState = const ChapterDownloadState.pending(),
  });

  bool get shouldDownload => isSelected && chapter.content == null;

  ChapterDownloadState get displayDownloadState {
    if (chapter.content != null) {
      return const ChapterDownloadState.complete();
    } else if (!isSelected) {
      return const ChapterDownloadState.skip();
    }

    return downloadState;
  }

  ChapterState copyWith({
    Volume? volume,
    Chapter? chapter,
    bool? isSelected,
    ChapterDownloadState? downloadState,
  }) {
    return ChapterState(
      volume ?? this.volume,
      chapter ?? this.chapter,
      isSelected: isSelected ?? this.isSelected,
      downloadState: downloadState ?? this.downloadState,
    );
  }
}
