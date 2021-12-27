import 'dart:io';

import 'package:chapturn_webext/utils/services/package_service.dart';
import 'package:chapturn_sources/chapturn_sources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EpubPackager', () {
    test('should package to epub', () async {
      final novel = Novel(
        title: 'Another',
        url: 'https://test.service/epub',
        lang: 'en',
      );

      var data = await EpubPackager().package(novel);
    });

    test('should package to epub (http)', () async {
      const url =
          'https://www.scribblehub.com/series/180910/the-immortal-witchs-death-wish/';

      var tuple = crawlerByUrl(url);
      if (tuple == null) {
        return;
      }

      final meta = tuple.meta();
      final crawler = tuple.create();

      final novel = await crawler.parseNovel(url);
      novel.volumes.add(Volume(
          index: 1,
          name: 'Another',
          chapters: [Chapter(index: 70, title: 'Ho ho', url: 'https')]));

      var data = await EpubPackager().package(novel);
      await File('c:/Users/User/Desktop/test.epub').writeAsBytes(data!);
    }, skip: 'Http request');
  });
}
