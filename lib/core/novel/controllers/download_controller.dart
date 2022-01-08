import 'package:chapturn_browser_extension/core/novel/providers.dart';
import 'package:chapturn_browser_extension/core/novel/models.dart';
import 'package:chapturn_browser_extension/utils/shared/option.dart';
import 'package:chapturn_sources/chapturn_sources.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'package:mutex/mutex.dart';

import 'chapter_list_controller.dart';

part 'download_controller.freezed.dart';

@freezed
class DownloadControllerState with _$DownloadControllerState {
  const factory DownloadControllerState.idle() = DownloadControllerIdle;
  const factory DownloadControllerState.inProgress() = ControllerInProgress;
}

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
class DownloadState with _$DownloadState {
  const factory DownloadState.empty() = DownloadEmpty;
  const factory DownloadState.pending(Iterable<ChapterState> pending) =
      DownloadPending;
  const factory DownloadState.downloading(int value) = Downloading;
  const factory DownloadState.complete() = DownloadComplete;
}

class DownloadController extends StateNotifier<DownloadControllerState> {
  DownloadController(this.read, this.crawler, this.taskMutex)
      : super(const DownloadControllerState.idle());

  List<ChapterState> pending = [];
  final Mutex pendingMutex = Mutex();

  final Reader read;
  final Option<NovelCrawler> crawler;
  final Mutex taskMutex;

  Future<void> updatePending(List<ChapterState> newPending) async {
    await pendingMutex.protect(() async {
      pending = newPending;
    });
  }

  Future<void> start({bool stopTask = false}) async {
    if (pending.isEmpty) {
      return;
    }

    state = const DownloadControllerState.inProgress();
    read(taskRunningController.notifier).state = true;

    await taskMutex.protect(() async {
      while (true) {
        final item = await pendingMutex.protect(() async {
          if (pending.isEmpty) {
            return null;
          }

          return pending.firstWhereOrNull((element) => element.shouldDownload);
        });

        if (item == null) {
          break;
        }

        chapterListController.setDownloadState(
            item, const ChapterDownloadState.pending());

        try {
          await crawler.when(
            none: () => throw Exception(),
            data: (value) async {
              await value.parseChapter(item.chapter);
            },
          );

          state = const DownloadControllerState.inProgress();
        } catch (e) {
          chapterListController.setDownloadState(
              item, ChapterDownloadState.error(e.toString()));

          continue;
        }

        chapterListController.setDownloadState(
            item, const ChapterDownloadState.complete());
      }
    });

    if (stopTask) read(taskRunningController.notifier).state = false;
    if (!mounted) {
      return;
    }

    state = const DownloadControllerState.idle();
  }

  ChapterListController get chapterListController =>
      read(chapterListProvider.notifier);
}
