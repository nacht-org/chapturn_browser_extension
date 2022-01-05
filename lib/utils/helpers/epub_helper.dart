import 'package:chapturn_sources/chapturn_sources.dart';
import 'package:epublib/epublib.dart' as epublib;

extension NamespaceTo on Namespace {
  epublib.Namespace to() {
    switch (this) {
      case Namespace.dc:
        return epublib.Namespace.dc;
      case Namespace.opf:
        return epublib.Namespace.dc;
    }
  }
}
