import 'package:chapturn_sources/chapturn_sources.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:chapturn_browser_extension/core/novel/notifiers/chapter_state.dart';

part 'indexed.freezed.dart';

@freezed
class ChapterListItem with _$ChapterListItem {
  const factory ChapterListItem.volume(Volume volume) = _VolumeListItem;
  const factory ChapterListItem.chapter(ChapterState chapter) =
      _ChapterListItem;
}

class AccessIndex {
  int vIndex;
  int? cIndex;

  AccessIndex(this.vIndex, [this.cIndex]);
}

class ChapterList {
  Map<int, VolumeItem> volumes = {};
  List<AccessIndex> indexes = [];

  ChapterList({
    required this.indexes,
    required this.volumes,
  });

  ChapterList.generate(Novel novel) {
    for (var volume in novel.volumes) {
      final item = VolumeItem(volume);

      volumes[volume.index] = item;

      indexes.add(AccessIndex(volume.index));
      indexes.addAll(item.chapters.values
          .map((e) => AccessIndex(volume.index, e.chapter.index)));
    }
  }

  ChapterListItem indexed(AccessIndex index) {
    if (index.cIndex != null) {
      return ChapterListItem.chapter(
          volumes[index.vIndex]!.chapters[index.cIndex]!);
    } else {
      return ChapterListItem.volume(volumes[index.vIndex]!.volume);
    }
  }

  List<ChapterState> get firstVolume =>
      volumes.values.first.chapters.values.toList();

  int get count => volumes.values.map((e) => e.chapters.length).sum;

  bool get multiVolume =>
      volumes.length > 1 && volumes.values.first.volume.index < 0;

  Iterable<ChapterState> all() sync* {
    for (var item in volumes.values) {
      for (var c in item.chapters.values) {
        yield c;
      }
    }
  }

  Iterable<ChapterState> pending() sync* {
    for (var c in all()) {
      if (c.shouldDownload) {
        yield c;
      }
    }
  }

  ChapterList copyWith({
    List<AccessIndex>? indexes,
    Map<int, VolumeItem>? volumes,
  }) {
    return ChapterList(
      indexes: indexes ?? this.indexes,
      volumes: volumes ?? this.volumes,
    );
  }
}

class VolumeItem {
  Volume volume;
  Map<int, ChapterState> chapters = {};

  VolumeItem(this.volume) {
    for (var chapter in volume.chapters) {
      // chapters[chapter.index] = ChapterState(volume.index, chapter);
    }
  }
}

// class ChapterListNotifier extends StateNotifier<ChapterList> {
//   ChapterListNotifier(Novel novel) : super(ChapterList.generate(novel));

//   void select(int vIndex, int cIndex, bool? value) {
//     final volumes = state.volumes;
//     volumes[vIndex]!.chapters[cIndex] =
//         volumes[vIndex]!.chapters[cIndex]!.copy(isSelected: value ?? true);

//     state = state.copyWith(volumes: volumes);
//   }
// }

// class IndexedAccess {
//   final int volumeIndex;
//   final int? chapterIndex;

//   const IndexedAccess(this.volumeIndex, [this.chapterIndex]);

//   bool get isChapter => chapterIndex != null;
// }

// class IndexedParent {

//   /// Flat list of indexes so to help when building chapter list
//   List<IndexedAccess> flat = [];

//   /// Indexed volumes
//   late Map<int, IndexedVolume> volumes;

//   IndexedParent(List<Volume> volumeList) {
//     final entries = <MapEntry<int, IndexedVolume>>[];

//     for (var volume in volumeList) {
//       entries.add(MapEntry(volume.index, IndexedVolume(volume)));
//         flat.add(IndexedAccess(volume.index));
//         flat.addAll(volume.chapters.map(
//           (chapter) => IndexedAccess(volume.index, chapter.index),
//         ));
//     }

//     volumes = Map.fromEntries(entries);
//   }

//   Iterable<
// }

// class IndexedVolume {
//   Map<int, Chapter> chapters;

//   IndexedVolume(Volume volume) {
    
//   }
// }