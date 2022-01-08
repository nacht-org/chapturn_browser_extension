import 'dart:typed_data';

import 'package:chapturn_browser_extension/core/novel/controllers/download_controller.dart';
import 'package:chapturn_browser_extension/core/novel/providers.dart';

import 'package:chapturn_browser_extension/utils/helpers/io_helper/io_helper.dart';
import 'package:chapturn_browser_extension/utils/helpers/text_helper.dart';
import 'package:chapturn_browser_extension/utils/services/package_service.dart';
import 'package:chapturn_browser_extension/utils/shared/option.dart';
import 'package:chapturn_sources/chapturn_sources.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:mutex/mutex.dart';

part 'packaging_controller.freezed.dart';

@freezed
class PackagingState with _$PackagingState {
  const factory PackagingState.idle() = IdlePackaingState;
  const factory PackagingState.waiting() = WaitingPackagingState;
  const factory PackagingState.preparing() = PreparingPackagingState;
  const factory PackagingState.busy() = BusyPackagingState;
}

class PackagingController extends StateNotifier<PackagingState> {
  PackagingController(
    this.read,
    this.novel,
    this.packager,
    this.taskMutex,
  ) : super(const PackagingState.idle());

  DownloadState downloadControllerState = const DownloadState.empty();
  final Mutex downloadMutex = Mutex();

  bool hasPending = false;
  final Mutex pendingMutex = Mutex();

  final Reader read;
  final Option<Novel> novel;
  final Packager packager;
  final Mutex taskMutex;

  Future<void> updateDownloadState(DownloadState newState) async {
    await downloadMutex.protect(() async {
      downloadControllerState = newState;
    });
  }

  Future<void> updatePending(bool hasPending) async {
    await pendingMutex.protect(() async {
      this.hasPending = hasPending;
    });
  }

  Future<void> package() async {
    if (hasPending) {
      read(downloadController.notifier).start(stopTask: false);
    }

    read(taskRunningController.notifier).state = true;

    // Check and wait until download task is completed
    if (taskMutex.isLocked) {
      state = const PackagingState.waiting();
      await taskMutex.protect(() async {});
    }

    await novel.when(
      none: () => throw Exception(),
      data: (value) async {
        state = const PackagingState.preparing();
        Uint8List? thumbnail = await _thumbnail(value);

        state = const PackagingState.busy();
        final bytes = await _package(value, thumbnail);

        if (bytes != null) {
          downloadFile(slugifyMinimal(value.title) + '.epub', bytes);
        } else {
          print('Failed to package: epub is null');
        }
      },
    );

    read(taskRunningController.notifier).state = false;

    if (!mounted) {
      return;
    }

    state = const PackagingState.idle();
  }

  Future<Uint8List?> _thumbnail(Novel novel) async {
    Uint8List? bytes;
    if (novel.thumbnailUrl != null) {
      if (!mounted) return null;
      state = const PackagingState.preparing();

      final response = await http.get(Uri.parse(novel.thumbnailUrl!));
      bytes = response.bodyBytes;
    }

    return bytes;
  }

  Future<List<int>?> _package(Novel novel, List<int>? thumbnail) async {
    List<int>? bytes;
    try {
      bytes = await packager.package(novel, thumbnailBytes: thumbnail);
    } catch (e) {
      print(e);
    }

    return bytes;
  }
}
