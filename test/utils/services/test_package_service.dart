import 'dart:io';

import 'package:chapturn_browser_extension/utils/services/package_service.dart';
import 'package:chapturn_sources/chapturn_sources.dart';
import 'package:chapturn_sources/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EpubPackager', () {
    final url =
        'https://www.scribblehub.com/series/180910/the-immortal-witchs-death-wish/';

    test('should package to epub', () async {
      var tuple = crawlerByUrl(url);
      if (tuple == null) {
        return;
      }

      final meta = tuple.item1();
      final crawler = tuple.item2();

      final novel = await crawler.parseNovel(url);
      novel.volumes.add(Volume(
          index: 1,
          name: 'Another',
          chapters: [Chapter(index: 70, title: 'Ho ho', url: 'https')]));

      var data = await EpubPackager().package(novel);
      await File('c:/Users/User/Desktop/test.epub').writeAsBytes(data!);
    });
  });
}
