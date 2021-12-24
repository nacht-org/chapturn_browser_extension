import 'dart:convert' as convert;

import 'package:chapturn_sources/models/models.dart';

import '../epub/models.dart';
import '../epub/writer.dart';

/// packager interface
abstract class Packager {
  String get name;
  Future<List<int>?> package(Novel novel);
}

class EpubPackager implements Packager {
  @override
  String get name => 'Epub';

  @override
  Future<List<int>?> package(Novel novel, {List<int>? thumbnailBytes}) async {
    final book = EpubBook(
      uid: 'test',
      title: novel.title,
    );

    book.addAuthor(novel.author ?? 'author');

    final chapterMap = <Volume, List<EpubHtml>>{};
    for (var volume in novel.volumes) {
      chapterMap[volume] = [];

      for (var chapter in volume.chapters) {
        var epubChapter = chapter_html(novel, chapter);
        book.addItem(epubChapter);
        chapterMap[volume]!.add(epubChapter);
      }
    }

    if (chapterMap.keys.toList().length == 1) {
      book.toc = [for (var c in chapterMap.values.first) Link.html(c)];
    } else {
      for (var entry in chapterMap.entries) {
        final section = Section(
          entry.key.name,
          items: [for (var c in entry.value) Link.html(c)],
        );

        book.toc.add(section);
      }
    }

    book.addItem(EpubNcx());
    book.addItem(EpubNav());

    book.spine = [for (var v in chapterMap.values) ...v];

    return EpubWriter(novel.title, book).write();
  }

  EpubHtml chapter_html(Novel novel, Chapter chapter) {
    final content = '<h1>${chapter.title}</h1>${chapter.content}';
    final filename =
        'chapters/' + chapter.index.toString().padLeft(4, "0") + '.xhtml';

    return EpubHtml(
      title: chapter.title,
      filename: filename,
      content: convert.utf8.encode(content),
    );
  }
}
