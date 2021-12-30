import 'package:chapturn_sources/chapturn_sources.dart';
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:chapturn_browser_extension/core/novel/models/indexed.dart';
import 'package:chapturn_browser_extension/core/novel/notifiers/chapter_state.dart';
import 'package:chapturn_browser_extension/core/novel/notifiers/download_notifier.dart';
import 'package:chapturn_browser_extension/utils/services/providers.dart';

import 'notifiers/crawler_notifier.dart';

final crawlerNotifierProvider =
    StateNotifierProvider<CrawlerNotifier, CrawlerState>(
  (ref) => CrawlerNotifier(browser: ref.watch(browserServiceProvider)),
);

/// should be overriden when data is received
final crawlerDataProvider =
    Provider<DataCrawlerState>((ref) => throw UnimplementedError());

// class VolumeState {
//   final Volume volume;
//   final List<ChapterState> chapters;

//   VolumeState(this.volume, this.chapters);
//   VolumeState.from(this.volume)
//       : chapters = volume.chapters
//             .map((chapter) => ChapterState(volume, chapter))
//             .toList();

//   VolumeState copyWith({
//     Volume? volume,
//     List<ChapterState>? chapters,
//   }) {
//     return VolumeState(
//       volume ?? this.volume,
//       chapters ?? this.chapters,
//     );
//   }
// }

// class ChapterList extends StateNotifier<List<VolumeState>> {
//   ChapterList(List<Volume> state)
//       : super(state.map((volume) => VolumeState.from(volume)).toList());

//   void toggle(int chapterIndex, bool? value) {
//     state = [
//       for (var volume in state)
//         volume.copyWith(chapters: [
//           for (var chapter in volume.chapters)
//             if (chapter.chapter.index == chapterIndex)
//               chapter.copy(isSelected: value ?? true)
//             else
//               chapter
//         ])
//     ];
//   }
// }

final chapterListProvider = Provider<List<Volume>>(
  (ref) => ref.watch(crawlerDataProvider).novel.volumes,
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
      items.add(ChapterListItem.volume(volume));

      for (var chapter in volume.chapters) {
        items.add(ChapterListItem.chapter(chapter));
      }
    }

    return items;
  },
  dependencies: [chapterListProvider],
);

final singleVolumeProvider = Provider<List<Chapter>>(
  (ref) => ref.watch(chapterListProvider).first.chapters,
  dependencies: [chapterListProvider],
);

/// should be overriden when building chapter list
final chapterProvider = Provider<Chapter>((ref) => throw UnimplementedError());

final chapterStateProvider = StateNotifierProvider.autoDispose
    .family<ChapterNotifier, ChapterState, Chapter>(
  (ref, chapter) => ChapterNotifier(ChapterState(chapter)),
);

final pendingChaptersProvider = Provider.autoDispose<List<Chapter>>(
  (ref) {
    final pending = <Chapter>[];

    final volumes = ref.watch(chapterListProvider);
    for (var volume in volumes) {
      for (var chapter in volume.chapters) {
        final cs = ref.watch(chapterStateProvider(chapter));
        if (cs.shouldDownload) {
          pending.add(chapter);
        }
      }
    }

    return pending;
  },
  dependencies: [chapterListProvider],
);
