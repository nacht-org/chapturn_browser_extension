import 'package:chapturn_browser_extension/core/novel/controllers/packaging_controller.dart';
import 'package:chapturn_sources/chapturn_sources.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mutex/mutex.dart';

import 'models.dart';
import '../../utils/services/providers.dart';
import '../../utils/shared/option.dart';
import 'controllers/chapter_list_controller.dart';
import 'controllers/crawler_controller.dart';
import 'controllers/download_controller.dart';

final crawlerController =
    StateNotifierProvider<CrawlerController, CrawlerState>(
  (ref) => CrawlerController(browser: ref.watch(browserServiceProvider)),
);

final crawlerDataProvider = Provider<Option<DataCrawlerState>>((ref) {
  final crawlerState = ref.watch(crawlerController);

  if (crawlerState is DataCrawlerState) {
    return Option.data(crawlerState);
  } else {
    return const Option.none();
  }
});

final crawlerInstanceProvider = Provider<Option<NovelCrawler>>(
  (ref) => ref.watch(crawlerDataProvider).whenData((data) => data.crawler),
);

final chapterListProvider =
    StateNotifierProvider<ChapterListController, List<VolumeState>>(
  (ref) => ref.watch(crawlerDataProvider).when(
        none: () => ChapterListController([]),
        data: (data) => ChapterListController(data.novel.volumes),
      ),
);

final chapterCountProvider = Provider<int>(
  (ref) => ref.watch(crawlerDataProvider).when(
        none: () => 0,
        data: (data) => data.novel.chapterCount(),
      ),
);

final pendingProvider = Provider<List<ChapterState>>(
  (ref) {
    return [
      for (var vs in ref.watch(chapterListProvider))
        for (var cs in vs.chapters)
          if (cs.shouldDownload) cs
    ];
  },
);

final isMultiVolumeProvider = Provider<bool>(
  (ref) {
    return ref.watch(crawlerDataProvider).when(
          none: () => false,
          data: (data) {
            final volumes = data.novel.volumes;
            return volumes.length != 1 && volumes.first.index < 0;
          },
        );
  },
);

final multiVolumeProvider = Provider<List<ChapterListItem>>(
  (ref) {
    final items = <ChapterListItem>[];

    for (var volume in ref.watch(chapterListProvider)) {
      items.add(ChapterListItem.volume(volume.volume));

      for (var chapter in volume.chapters) {
        items.add(ChapterListItem.chapter(chapter));
      }
    }

    return items;
  },
);

final singleVolumeProvider = Provider<List<ChapterState>>(
  (ref) {
    final volumes = ref.watch(chapterListProvider);
    return volumes.isEmpty ? [] : volumes.first.chapters;
  },
);

final taskMutexProvider = Provider<Mutex>((ref) => Mutex());

final taskRunningController = StateProvider<bool>((ref) => false);

final downloadController =
    StateNotifierProvider<DownloadController, DownloadControllerState>(
  (ref) {
    final controller = DownloadController(
      ref.read,
      ref.watch(crawlerInstanceProvider),
      ref.watch(taskMutexProvider),
    );

    ref.listen<List<ChapterState>>(
      pendingProvider,
      (_, pending) async {
        controller.updatePending(pending);
      },
      fireImmediately: true,
    );

    return controller;
  },
);

final downloadStateProvider = Provider<DownloadState>((ref) {
  final controllerState = ref.watch(downloadController);
  final pending = ref.watch(pendingProvider);

  return controllerState.when(
    idle: () {
      if (pending.isEmpty) {
        return const DownloadState.complete();
      }

      return DownloadState.pending(pending);
    },
    inProgress: () => DownloadState.downloading(pending.length),
  );
});

final packagingController =
    StateNotifierProvider<PackagingController, PackagingState>(
  (ref) {
    final controller = PackagingController(
      ref.read,
      ref.watch(crawlerDataProvider).whenData((data) => data.novel),
      ref.watch(packagerProvider),
      ref.watch(taskMutexProvider),
    );

    ref.listen<DownloadState>(
      downloadStateProvider,
      (_, state) => controller.updateDownloadState(state),
      fireImmediately: true,
    );

    ref.listen<List<ChapterState>>(
      pendingProvider,
      (_, pending) => controller.updatePending(pending.isNotEmpty),
      fireImmediately: true,
    );

    return controller;
  },
);

/// should be overriden when building chapter list
final chapterProvider =
    Provider<ChapterState>((ref) => throw UnimplementedError());
