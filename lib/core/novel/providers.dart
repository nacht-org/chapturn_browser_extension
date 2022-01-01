import 'package:chapturn_browser_extension/core/alert/providers.dart';
import 'package:collection/collection.dart';
import 'package:chapturn_browser_extension/core/novel/notifiers/packaging_notifier.dart';
import 'package:chapturn_sources/chapturn_sources.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:chapturn_browser_extension/utils/services/chapter/models.dart';
import 'package:chapturn_browser_extension/core/novel/notifiers/download_notifier.dart';
import 'package:chapturn_browser_extension/utils/services/providers.dart';

import 'notifiers/chapter_download_states.dart';
import 'notifiers/chapter_list_notifier.dart';
import 'notifiers/crawler_notifier.dart';

final crawlerNotifierProvider =
    StateNotifierProvider<CrawlerNotifier, CrawlerState>(
  (ref) => CrawlerNotifier(browser: ref.watch(browserServiceProvider)),
);

/// should be overriden when data is received
final crawlerDataProvider =
    Provider<DataCrawlerState>((ref) => throw UnimplementedError());

final crawlerInstanceProvider = Provider<NovelCrawler>(
  (ref) => ref.watch(crawlerDataProvider).crawler,
  dependencies: [crawlerDataProvider],
);

final chapterListProvider =
    StateNotifierProvider<ChapterList, List<VolumeState>>(
  (ref) {
    return ChapterList(ref.watch(crawlerDataProvider).novel.volumes);
  },
  dependencies: [crawlerDataProvider],
);

final chapterCountProvider = Provider<int>(
  (ref) => ref.watch(crawlerDataProvider).novel.chapterCount(),
  dependencies: [crawlerDataProvider],
);

final isMultiVolumeProvider = Provider<bool>(
  (ref) {
    final volumes = ref.watch(crawlerDataProvider).novel.volumes;
    return volumes.length != 1 && volumes.first.index < 0;
  },
  dependencies: [crawlerDataProvider],
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
  dependencies: [chapterListProvider],
);

final singleVolumeProvider = Provider<List<ChapterState>>(
  (ref) {
    return ref.watch(chapterListProvider).first.chapters;
  },
  dependencies: [chapterListProvider],
);

final pendingProvider = Provider<List<ChapterState>>(
  (ref) {
    return [
      for (var vs in ref.watch(chapterListProvider))
        for (var cs in vs.chapters)
          if (cs.shouldDownload) cs
    ];
  },
  dependencies: [chapterListProvider],
);

final downloadStatesProvider = StateNotifierProvider<DownloadStatesNotifier,
    Map<int, ChapterDownloadState>>(
  (ref) {
    final chapterList = ref.watch(chapterListProvider);

    final map = <int, ChapterDownloadState>{};
    for (var vs in chapterList) {
      for (var cs in vs.chapters) {
        map[cs.chapter.index] = ChapterDownloadState.pending;
      }
    }

    return DownloadStatesNotifier(map);
  },
  dependencies: [chapterListProvider],
);

final chapterDownloadStateProvider =
    Provider.autoDispose.family<ChapterDownloadState, int>(
  (ref, index) {
    return ref.watch(downloadStatesProvider)[index]!;
  },
  dependencies: [downloadStatesProvider],
);

final downloadNotifierProvider =
    StateNotifierProvider<DownloadNotifier, DownloadState>(
  (ref) {
    return DownloadNotifier(
      ref.read,
      ref.watch(crawlerInstanceProvider),
      ref.watch(pendingProvider),
    );
  },
  dependencies: [
    pendingProvider,
    crawlerInstanceProvider,
    downloadStatesProvider.notifier
  ],
);

final packagingProvider =
    StateNotifierProvider<PackagingNotifer, PackagingState>(
  (ref) {
    return PackagingNotifer(
      ref.read,
      ref.watch(crawlerDataProvider).novel,
      ref.watch(packagerProvider),
      ref.watch(pendingProvider).isNotEmpty,
    );
  },
  dependencies: [
    crawlerDataProvider,
    pendingProvider,
    packagerProvider,
    downloadNotifierProvider.notifier
  ],
);

final isTaskRunningProvider = Provider<bool>(
  (ref) =>
      ref.watch(downloadNotifierProvider) is ProgressDownloadState ||
      ref.watch(packagingProvider) is! IdlePackaingState,
  dependencies: [downloadNotifierProvider, packagingProvider],
);

/// should be overriden when building chapter list
final chapterProvider =
    Provider<ChapterState>((ref) => throw UnimplementedError());
