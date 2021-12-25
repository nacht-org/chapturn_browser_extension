import 'package:chapturn_browser_extension/utils/helpers/text_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('capitalize(String)', () {
    test('should return on empty string', () {
      expect('', capitalize(''));
    });

    test('should capitalize first character', () {
      expect('Text', capitalize('text'));
      expect('Mist', capitalize('mist'));
      expect('Tetra', capitalize('Tetra'));
      expect('Fiction', capitalize('Fiction'));
      expect('Defined outside', capitalize('defined outside'));
    });
  });
}
