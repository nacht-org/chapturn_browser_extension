import 'dart:collection';

import 'package:chapturn_browser_extension/utils/services/chapter/models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'controller.dart';
import 'list.dart';
import 'state_map.dart';

/// Controls chapter download states for chapter
final downloadStateMapController =
    StateNotifierProvider<DownloadStateMapNotifier, DownloadStateMap>(
  (ref) => DownloadStateMapNotifier({}),
);

/// Returns the suitable download state for chapter state
///
/// - [ChapterDownloadState.complete] if chapter has content
/// - [ChapterDownloadState.skip] if chapter is unselected
/// - [ChapterDownloadState.pending] if chapter is not present in downloads
///
/// else the recorded state in [downloadStates]
final chapterDownloadStateProvider = Provider.autoDispose
    .family<ChapterDownloadState, ChapterState>((ref, state) {
  if (state.chapter.content != null) {
    return const ChapterDownloadState.complete();
  } else if (!state.isSelected) {
    return const ChapterDownloadState.skip();
  }

  return ref.watch(downloadStateMapController)[state] ??
      const ChapterDownloadState.pending();
});

/// Holds the download list/queue
///
/// Must be modified using [downloadListController]
///
/// This emulates fields in a database, and thus is mutable and
/// must be used with caution.
///
/// Does not rebuild
final _downloadList = Provider<DownloadList>((ref) => []);

/// [DownloadListController] is used to manipulate [_downloadList]
///
/// [_downloadList] should never be manually manipulated
/// as no change will be emitted since its a [Provider]
///
/// In a real database driven app, this would be a service that
/// allows updating download list
///
/// Does not rebuild
final downloadListController =
    StateNotifierProvider<DownloadListController, bool>(
  (ref) => DownloadListController(ref.watch(_downloadList)),
);

/// Download controller used to call start and stops
/// downloads when [_downloadList] is exhausted
///
/// Pause functionality is not available yet
/// (would need to use isolates)
///
/// Does not rebuild
final downloadController =
    StateNotifierProvider<DownloadController, DownloadControllerState>(
  (ref) => DownloadController(
    ref.read,
    ref.watch(_downloadList),
    const DownloadControllerState.idle(),
  ),
);

/// All downloads currently pending
final pendingDownloadsProvider = Provider<List<DownloadItem>>((ref) {
  // only watching if state changes
  ref.watch(downloadListController);

  return ref
      .watch(_downloadList)
      .where((item) => item.chapterState.shouldDownload)
      .toList();
});

/// Indicates the actual state of the downloads
///
/// Conditions:
/// - [DownloadState.empty] if nothing is in the download list
/// - [DownloadState.pending] if chapters that need downloading are in list
/// - [DownloadState.complete] if all selected chapters have content
/// - [DownloadState.downloading] if download controller is downloading
///
/// Refreshes when states changes of:
/// - [downloadListController]
/// - [downloadController]
final downloadStateProvider = Provider<DownloadState>((ref) {
  // only watching if state changes
  ref.watch(downloadListController);

  final downloadList = ref.watch(_downloadList);
  final downloadControllerState = ref.watch(downloadController);
  final pending =
      ref.watch(pendingDownloadsProvider).map((item) => item.chapterState);

  return downloadControllerState.when(
    idle: () {
      if (downloadList.isEmpty) {
        return const DownloadState.empty();
      }

      return pending.isEmpty
          ? const DownloadState.complete()
          : DownloadState.pending(pending);
    },
    downloading: (value) => DownloadState.downloading(pending.length),
  );
});

/// Exposes an updating download list instance
final downloadList = Provider<DownloadList>((ref) {
  // only watching if state changes
  ref.watch(downloadListController);

  return ref.watch(_downloadList);
});
