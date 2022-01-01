import 'package:chapturn_sources/chapturn_sources.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/services/chapter/models.dart';

part 'chapter_list_notifier.freezed.dart';

@freezed
class ChapterListItem with _$ChapterListItem {
  const factory ChapterListItem.volume(Volume volume) = _VolumeListItem;
  const factory ChapterListItem.chapter(ChapterState chapter) =
      _ChapterListItem;
}

class VolumeState {
  final Volume volume;
  final List<ChapterState> chapters;

  VolumeState(this.volume, this.chapters);
  VolumeState.from(this.volume)
      : chapters = volume.chapters
            .map((chapter) => ChapterState(volume, chapter))
            .toList();

  VolumeState copyWith({
    Volume? volume,
    List<ChapterState>? chapters,
  }) {
    return VolumeState(
      volume ?? this.volume,
      chapters ?? this.chapters,
    );
  }
}

class ChapterList extends StateNotifier<List<VolumeState>> {
  ChapterList(List<Volume> state)
      : super(state.map((volume) => VolumeState.from(volume)).toList());

  void toggle(int chapterIndex, bool? value) {
    state = [
      for (var volume in state)
        volume.copyWith(chapters: [
          for (var chapter in volume.chapters)
            if (chapter.chapter.index == chapterIndex)
              chapter.copyWith(isSelected: value ?? true)
            else
              chapter
        ])
    ];
  }
}
