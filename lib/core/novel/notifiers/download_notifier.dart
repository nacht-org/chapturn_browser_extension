import 'package:chapturn_browser_extension/core/novel/models/indexed.dart';
import 'package:chapturn_browser_extension/core/novel/providers.dart';
import 'package:chapturn_sources/chapturn_sources.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'chapter_state.dart';

part 'download_notifier.freezed.dart';

enum ChapterDownloadState {
  pending,
  unselected,
  inProgress,
  complete,
}

@freezed
abstract class DownloadState with _$DownloadState {
  const factory DownloadState.idle() = IdleDownloadState;
  const factory DownloadState.pending(int count) = PendingDownloadState;
  const factory DownloadState.progress(int progress, int total) =
      ProgressDownloadState;
  const factory DownloadState.complete() = CompleteDownloadState;
}

class DownloadNotifier extends StateNotifier<DownloadState> {
  DownloadNotifier(this.read, this.pending)
      : super(
          pending.isEmpty
              ? const DownloadState.complete()
              : DownloadState.pending(pending.length),
        );

  final List<ChapterState> pending;
  final Reader read;

  Future<void> start() async {
    if (state is! PendingDownloadState) {
      return;
    }

    state = DownloadState.progress(0, pending.length);

    final downloadStates = read(downloadStatesProvider.notifier);

    // final _pending = [...pending];
    for (var chapter in pending) {
      await Future.delayed(const Duration(seconds: 1));

      state = DownloadState.progress(
        (state as ProgressDownloadState).progress + 1,
        pending.length,
      );
    }

    state = const DownloadState.complete();
  }
}
