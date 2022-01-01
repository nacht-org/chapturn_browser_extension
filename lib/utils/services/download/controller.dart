import 'dart:collection';

import 'package:chapturn_browser_extension/utils/services/download/providers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../chapter/models.dart';
import 'list.dart';
import 'state_map.dart';

part 'controller.freezed.dart';

@freezed
class DownloadControllerState with _$DownloadControllerState {
  const factory DownloadControllerState.idle() = DownloadControllerIdle;
  const factory DownloadControllerState.downloading(int value) =
      ControllerDownloading;
}

class DownloadController extends StateNotifier<DownloadControllerState> {
  DownloadController(
    this.read,
    this.downloadList,
    DownloadControllerState state,
  ) : super(state);

  final Reader read;
  final DownloadList downloadList;

  Future<void> start() async {
    if (downloadList.isEmpty) {
      return;
    }

    state = const DownloadControllerState.downloading(0);

    final _chapterStateController = read(downloadStateMapController.notifier);
    final _downloadlistController = read(downloadListController.notifier);

    _chapterStateController.setMultipleDownloadStates(
      downloadList.map((item) => item.chapterState.chapter),
      const ChapterDownloadState.pending(),
    );

    int index = 0;

    // Download until download listt is empty
    while (downloadList.length > index) {
      final item = downloadList[index];
      print(item);

      if (item.chapterState.shouldDownload) {
        _chapterStateController.setDownloadState(
          item.chapterState.chapter,
          const ChapterDownloadState.downloading(),
        );

        try {
          await item.crawler.parseChapter(item.chapterState.chapter);
          state = DownloadControllerState.downloading(
            (state as ControllerDownloading).value + 1,
          );
        } catch (e) {
          _chapterStateController.setDownloadState(
            item.chapterState.chapter,
            ChapterDownloadState.error(e.toString()),
          );

          index++;
          continue;
        }
      }

      // remove item when completed
      _downloadlistController.remove(item);
      _chapterStateController.remove(item.chapterState.chapter);
    }

    state = const DownloadControllerState.idle();
  }
}
