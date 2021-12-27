import 'package:chapturn_webext/constants/replacements.dart';
import 'package:chapturn_webext/core/novel/pages/novel_page.dart';

String capitalize(String text) {
  if (text.isEmpty) {
    return text;
  }

  return text.substring(0, 1).toUpperCase() + text.substring(1);
}

final _dupeSpaceRegExp = RegExp(r'\s{2,}');
final _punctuationRegExp = RegExp(r'[^\w\s-]');
final _badCharRegExp = RegExp(r'''[\\/:*"\'<>|.%$^&£?]''');

/// Converts [text] to a slug [String] separated by the [delimiter].
String slugify(String text, {String delimiter = '-', bool lowercase = true}) {
  // Trim leading and trailing whitespace.
  var slug = text.trim();

  // Make the text lowercase (optional).
  if (lowercase) {
    slug = slug.toLowerCase();
  }

  // Substitute characters for their latin equivalent.
  replacements.forEach((k, v) => slug = slug.replaceAll(k, v));

  slug = slug
      // Condense whitespaces to 1 space.
      .replaceAll(_dupeSpaceRegExp, ' ')
      // Remove punctuation.
      .replaceAll(_punctuationRegExp, '')
      // Replace space with the delimiter.
      .replaceAll(' ', delimiter);

  return slug;
}

/// Converts [text] to a slug [String] by replacing bad
/// characters with [replace]
String slugifyMinimal(String text, {String replace = '_'}) {
  return text.replaceAll(_badCharRegExp, replace);
}
