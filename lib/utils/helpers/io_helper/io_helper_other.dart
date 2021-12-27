import 'dart:io';

import 'package:flutter/foundation.dart';

Future<void> downloadFile(
  String filename,
  List<int> bytes, {
  String? mimetype,
  Duration wait = const Duration(milliseconds: 100),
}) async {
  if (kReleaseMode) {
    return;
  }

  File('../$filename').writeAsBytes(bytes);
}
