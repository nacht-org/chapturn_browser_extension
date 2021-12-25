import 'package:chapturn_sources/models/volume.dart';
import 'package:flutter/foundation.dart';

import 'chapter_model.dart';

class VolumeModel extends ChangeNotifier {
  Volume volume;
  late Map<int, ChapterModel> chapters;

  VolumeModel(this.volume) {
    chapters = Map.fromEntries(
      volume.chapters.map((c) => MapEntry(c.index, ChapterModel(volume, c))),
    );
  }

  /// All selected chapters have content
  bool get isDownloaded => pendingDownload().isEmpty;

  List<ChapterModel> pendingDownload() {
    return chapters.values.where((element) => element.shouldDownload).toList();
  }
}
