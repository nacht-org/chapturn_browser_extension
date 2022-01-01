import 'package:chapturn_browser_extension/utils/services/download/list.dart';
import 'package:chapturn_browser_extension/utils/services/download/providers.dart';
import 'package:chapturn_sources/chapturn_sources.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/services/chapter/models.dart';
import '../../utils/services/providers.dart';
import '../../utils/shared/option.dart';
import 'notifiers/chapter_list_notifier.dart';
import 'notifiers/crawler_notifier.dart';

final crawlerNotifierProvider =
    StateNotifierProvider<CrawlerNotifier, CrawlerState>(
  (ref) => CrawlerNotifier(browser: ref.watch(browserServiceProvider)),
);

/// should be overriden when data is received
final crawlerDataProvider = Provider<Option<DataCrawlerState>>((ref) {
  final crawlerState = ref.watch(crawlerNotifierProvider);

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
    StateNotifierProvider<ChapterList, List<VolumeState>>(
  (ref) => ref.watch(crawlerDataProvider).when(
        none: () => ChapterList([]),
        data: (data) => ChapterList(data.novel.volumes),
      ),
);

final chapterCountProvider = Provider<int>(
  (ref) => ref.watch(crawlerDataProvider).when(
        none: () => 0,
        data: (data) => data.novel.chapterCount(),
      ),
);

final selectedChaptersProvider = Provider<List<ChapterState>>(
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

final mixedDownloadStateProvider = Provider<DownloadState>((ref) {
  final selectedChapters = ref.watch(selectedChaptersProvider);
  final downloadState = ref.watch(downloadStateProvider);

  if (downloadState is Downloading) {
    return downloadState;
  }

  if (selectedChapters.isEmpty) {
    return const DownloadState.complete();
  } else {
    return DownloadState.pending(selectedChapters);
  }
});

/// should be overriden when building chapter list
final chapterProvider =
    Provider<ChapterState>((ref) => throw UnimplementedError());
