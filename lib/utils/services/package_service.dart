import 'dart:convert' as convert;

import 'package:chapturn_sources/chapturn_Sources.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as path;

import '../epub/models.dart';
import '../epub/writer.dart';

abstract class Packager {
  String get name;
  Future<List<int>?> package(Novel novel, {List<int>? thumbnailBytes});
}

@named
@Injectable(as: Packager)
class EpubPackager implements Packager {
  @override
  String get name => 'Epub';

  @override
  Future<List<int>?> package(Novel novel, {List<int>? thumbnailBytes}) async {
    final book = EpubBook(
      uid: 'test',
      title: novel.title,
    );

    if (novel.thumbnailUrl != null && thumbnailBytes != null) {
      book.setCover(
        'cover' + path.extension(novel.thumbnailUrl!),
        thumbnailBytes,
      );
    }

    // description
    book.addAuthor(novel.author ?? 'author');
    if (novel.description.isNotEmpty) {
      book.addMetaData(
        namespace: Namespace.DC,
        name: 'description',
        value: novel.description.join('\n'),
      );
    }

    if (novel.status != null) {
      book.addMetaData(
        namespace: Namespace.OPF,
        name: 'status',
        value: novel.status!,
      );
    }

    // all metadata
    for (var m in novel.metadata) {
      book.addMetaData(
        namespace: m.namespace,
        name: m.name,
        value: m.value,
        others: m.others,
      );
    }

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
