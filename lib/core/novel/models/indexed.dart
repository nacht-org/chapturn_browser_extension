import 'package:chapturn_sources/chapturn_sources.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:chapturn_browser_extension/core/novel/notifiers/chapter_state.dart';

part 'indexed.freezed.dart';

@freezed
class ChapterListItem with _$ChapterListItem {
  const factory ChapterListItem.volume(Volume volume) = _VolumeListItem;
  const factory ChapterListItem.chapter(Chapter chapter) = _ChapterListItem;
}
