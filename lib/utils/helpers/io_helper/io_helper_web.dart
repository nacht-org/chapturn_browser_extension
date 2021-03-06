import 'package:mime/mime.dart' as mime;
import 'dart:html' as html;

Future<void> downloadFile(
  String filename,
  List<int> bytes, {
  String? mimetype,
  Duration wait = const Duration(milliseconds: 100),
}) async {
  final _mimetype = mimetype ?? mime.lookupMimeType(filename);

  final blob = html.Blob([bytes], _mimetype);
  final url = html.Url.createObjectUrlFromBlob(blob);
  final a = html.AnchorElement()
    ..href = url
    ..download = filename
    ..setAttribute('hidden', 'true');

  html.document.append(a);
  a.click();

  // Wait for click event to be processed and cleanup
  await Future.delayed(wait);
  a.remove();
  html.Url.revokeObjectUrl(url);
}
