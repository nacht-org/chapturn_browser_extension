import 'dart:collection';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../chapter/models.dart';

part 'models.freezed.dart';

@freezed
class ChapterDownloadState with _$ChapterDownloadState {
  const factory ChapterDownloadState.skip() = ChapterDownloadSkip;
  const factory ChapterDownloadState.pending() = ChapterDownloadPending;
  const factory ChapterDownloadState.downloading() = ChapterDownloading;
  const factory ChapterDownloadState.complete() = ChapterDownloadComplete;
  const factory ChapterDownloadState.error(String reason) =
      ChapterDownloadError;
}

@freezed
class DownloadControllerState with _$DownloadControllerState {
  const factory DownloadControllerState.idle() = DownloadControllerIdle;
  const factory DownloadControllerState.downloading(int value, int total) =
      ControllerDownloading;
}

class DownloadController extends StateNotifier<DownloadControllerState> {
  DownloadController(
      this.read, this.downloadList, DownloadControllerState state)
      : super(state);

  final Reader read;
  final LinkedHashSet<ChapterState> downloadList;
}

@freezed
class DownloadState with _$DownloadState {
  const factory DownloadState.empty() = DownloadEmpty;
  const factory DownloadState.pending(Iterable<ChapterState> pending) =
      DownloadPending;
  const factory DownloadState.downloading(int value, int total) = Downloading;
  const factory DownloadState.complete() = DownloadComplete;
}

/// [bool] is used as state as we only need to indicate
/// when state has changed
class DownloadListController extends StateNotifier<bool> {
  DownloadListController(this.downloadList) : super(true);

  final LinkedHashSet<ChapterState> downloadList;

  void add(ChapterState chapterState) {
    downloadList.add(chapterState);
    state = !state;
  }
}
