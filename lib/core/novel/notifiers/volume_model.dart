import 'package:chapturn_sources/models/volume.dart';
import 'package:flutter/foundation.dart';

import 'chapter_model.dart';

class VolumeModel extends ChangeNotifier {
  Volume volume;
  late List<ChapterModel> chapters;

  VolumeModel(this.volume) {
    chapters = volume.chapters.map((c) => ChapterModel(c)).toList();
  }

  /// All selected chapters have content
  bool get isDownloaded => pendingDownload().isEmpty;

  List<ChapterModel> pendingDownload() {
    return chapters.where((element) => element.shouldDownload).toList();
  }
}
