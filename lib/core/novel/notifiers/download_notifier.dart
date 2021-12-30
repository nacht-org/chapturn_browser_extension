import 'package:chapturn_browser_extension/core/novel/models/indexed.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// part 'download_notifier.freezed.dart';

// @freezed
// abstract class DownloadState with _$DownloadState {
//   const factory DownloadState.idle() = IdleDownloadState;
//   const factory DownloadState.pending(int count) = PendingDownloadState;
//   const factory DownloadState.progress(int progress, int total) =
//       ProgressDownloadState;
//   const factory DownloadState.complete() = CompleteDownloadState;

//   factory DownloadState.infer(ChapterList chapterList) {
//     final pending = chapterList.pending().toList();

//     return pending.isEmpty
//         ? const DownloadState.complete()
//         : DownloadState.pending(pending.length);
//   }
// }

// class DownloadNotifier extends StateNotifier<DownloadState> {
//   DownloadNotifier(this.chapterList, DownloadState initial) : super(initial);

//   final ChapterList chapterList;

//   void start() {
//     if (state is! PendingDownloadState) {
//       return;
//     }

//     final pending = chapterList.pending().toList();
//     state = DownloadState.progress(0, pending.length);

//     for (var c in pending) {}
//   }
// }
