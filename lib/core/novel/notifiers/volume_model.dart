import 'package:chapturn_sources/models/volume.dart';
import 'package:flutter/foundation.dart';

import 'chapter_model.dart';

class VolumeNotifier extends ChangeNotifier {
  Volume volume;
  late List<ChapterNotifier> chapters;

  VolumeNotifier(this.volume) {
    chapters = volume.chapters.map((c) => ChapterNotifier(c)).toList();
  }

  /// All selected chapters have content
  bool get isDownloaded => pendingDownload().isEmpty;

  List<ChapterNotifier> pendingDownload() {
    return chapters.where((element) => element.shouldDownload).toList();
  }
}
