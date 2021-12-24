import 'package:chapturn_browser_extension/utils/epub/constants.dart';
import 'package:chapturn_sources/models/metadata.dart';
import 'package:path/path.dart' as path;
import 'package:html/parser.dart' as parser;
import 'package:tuple/tuple.dart';
import 'package:mime/mime.dart' as mime;
import 'package:xml/xml.dart';

// Navigation items

abstract class NavItem {}

class Section extends NavItem {
  String title;
  String href = '';
  List<NavItem> items;

  Section(this.title, {List<NavItem>? items}) : items = items ?? [];
}

class Flat extends NavItem {
  List<EpubHtml> items;
  Flat([List<EpubHtml>? items]) : items = items ?? [];
}

class Link extends NavItem {
  String? uid;
  String title;
  String href;

  Link(this.title, {this.uid, this.href = ''});
  Link.html(EpubHtml eh) : this(eh.title, uid: eh.uid, href: eh.filename);
}

class GuideItem {
  EpubHtml? item;
  String? href;
  String? title;
  String? type;

  GuideItem({
    this.item,
    this.href,
    this.title,
    this.type,
  });

  Map<String, String> asMap() {
    return {
      'type': type ?? '',
      'title': item?.title ?? title ?? '',
      'href': item?.filename ?? href ?? '',
    };
  }
}

// Epub items

enum ItemType {
  unknown,
  image,
  style,
  script,
  navigation,
  vector,
  font,
  video,
  audio,
  document,
  cover,
  smil,
}

enum EpubDirection {
  ltr,
  rtl,
  lro,
  rlo,
  def,
}

extension Value on EpubDirection {
  String get value => this == EpubDirection.def ? 'default' : name;
}

const extensions = {
  ItemType.image: ['.jpg', '.jpeg', '.gif', '.tiff', '.tif', '.png'],
  ItemType.style: ['.css'],
  ItemType.vector: ['.svg'],
  ItemType.font: ['.otf', '.woff', '.ttf'],
  ItemType.script: ['.js'],
  ItemType.navigation: ['.ncx'],
  ItemType.video: ['.mov', '.mp4', '.avi'],
  ItemType.audio: ['.mp3', '.ogg'],
  ItemType.cover: ['.jpg', '.jpeg', '.png'],
  ItemType.smil: ['.smil']
};

enum EpubProperties {
  scripted,
}

class EpubItem {
  String? uid;
  String filename;
  String mediatype;
  List<int> content;
  bool isLinear;
  bool manifest;

  late EpubBook book;

  EpubItem({
    this.uid = '',
    this.filename = '',
    this.mediatype = '',
    List<int>? content,
    this.isLinear = true,
    this.manifest = true,
  }) : content = content ?? [];

  ItemType get type {
    final ext = path.extension(filename).toLowerCase();

    for (var e in extensions.entries) {
      if (e.value.contains(ext)) {
        return e.key;
      }
    }

    return ItemType.unknown;
  }
}

class EpubNcx extends EpubItem {
  EpubNcx({String uid = 'ncx', String filename = 'toc.ncx'})
      : super(
          uid: uid,
          filename: filename,
          mediatype: 'application/x-dtbncx+xml',
        );
}

class EpubCover extends EpubItem {
  EpubCover(
      {String uid = 'cover-img', String filename = '', List<int>? content})
      : super(
          uid: uid,
          filename: filename,
          content: content,
        );

  @override
  ItemType get type => ItemType.cover;
}

class EpubHtml extends EpubItem {
  String title;
  String? lang;
  EpubDirection? direction;

  final List<Map<String, String>> links = [];
  final Set<EpubProperties> properties = {};

  EpubHtml({
    String? uid = '',
    String filename = '',
    String mediatype = '',
    List<int>? content,
    this.title = '',
    this.lang,
    this.direction,
  }) : super(
          uid: uid,
          filename: filename,
          mediatype: mediatype,
          content: content,
        );

  @override
  ItemType get type => ItemType.document;

  bool get isChapter => true;

  void addLink(Map<String, String> link) {
    links.add(link);
    if (link['type'] == 'text/javascript') {
      properties.add(EpubProperties.scripted);
    }
  }

  void addItem(EpubItem item) {
    switch (item.type) {
      case ItemType.style:
        addLink({
          'href': item.filename,
          'rel': 'stylesheet',
          'type': 'text/css',
        });
        break;
      case ItemType.script:
        addLink({
          'src': item.filename,
          'type': 'text/javascript',
        });
        break;
      default:
        break;
    }
  }

  String get body {
    final doc = parser.parse(content);
    final bodyElement = doc.querySelector('body');
    if (bodyElement == null) {
      return '';
    }

    return bodyElement.innerHtml;
  }

  String get html {
    final xmlTree = XmlDocument.parse(chapterXml);

    // set language
    xmlTree.setAttribute('lang', lang ?? book.lang);
    xmlTree.setAttribute('{${namespaces["XML"]}}lang', lang ?? book.lang);

    final head = XmlBuilder();
    head.element('head', nest: () {
      // title
      if (title.isNotEmpty) {
        head.element('title', nest: () {
          head.text(title.trim());
        });
      }

      // links and scripts
      for (var link in links) {
        if (link['type'] == 'text/javascript') {
          head.element('script', nest: () {
            link.forEach(head.attribute);
            // force <script></script>
            head.text('');
          });
        } else {
          head.element('link', nest: () {
            link.forEach(head.attribute);
          });
        }
      }
    });

    // build body
    final body = XmlBuilder();

    // direction
    xmlTree.setAttribute('dir', direction?.value ?? book.direction.value);
    body.element('body', nest: () {
      body.attribute('dir', direction?.value ?? book.direction.value);

      final htmlTree = parser.parse(content);
      final bodyHtml = htmlTree.body;
      if (bodyHtml != null) {
        body.xml(bodyHtml.innerHtml);
      }
    });

    // add head and body
    xmlTree.children
      ..add(head.buildFragment())
      ..add(body.buildFragment());

    return xmlTree.toXmlString(pretty: true);
  }
}

class EpubNav extends EpubHtml {
  EpubNav({
    String uid = 'nav',
    String filename = 'nav.xhtml',
    String mediatype = 'application/xhtml+xml',
  }) : super(
          uid: uid,
          filename: filename,
          mediatype: mediatype,
        );

  @override
  bool get isChapter => false;
}

class EpubImage extends EpubItem {
  @override
  ItemType get type => ItemType.image;
}

class EpubSMIL extends EpubItem {
  EpubSMIL({
    String? uid,
    String filename = '',
    List<int>? content,
  }) : super(
          uid: uid,
          filename: filename,
          content: content,
        );

  @override
  ItemType get type => ItemType.smil;
}

class EpubBook {
  String uid;
  String title;
  String lang;
  EpubDirection direction;

  Map<String?, Map<String, List<Tuple2<String, Map<String, String>>>>>
      metadata = {};

  int _htmlId = 0;
  int _imageId = 0;
  int _staticId = 0;

  List<EpubItem> items = [];
  List<NavItem> toc = [];
  List<EpubItem> spine = [];
  List<GuideItem> guide = [];
  List<Map<String, String>> bindings = [];

  // custom prefixes and namespaces to be set to the content.opf doc
  List<String> prefixes = [];
  Map<String, String> namespaces = {};

  static const identifierId = 'id';
  static const folderName = 'EPUB';

  EpubBook({
    required this.uid,
    required this.title,
    this.lang = 'en',
    this.direction = EpubDirection.def,
  }) {
    setMetaData(
      namespace: Namespace.DC,
      name: 'identifier',
      value: uid,
      others: {'id': identifierId},
    );

    addMetaData(namespace: Namespace.DC, name: 'title', value: title);
    addMetaData(namespace: Namespace.DC, name: 'language', value: lang);

    // Watermark
    addMetaData(
      namespace: Namespace.OPF,
      name: 'generator',
      value: '',
      others: {'name': 'generator', 'content': 'Chapturn'},
    );
  }

  // Add an author
  void addAuthor(
    String author, {
    String? fileAs,
    String? role,
    uid = 'creator',
  }) {
    addMetaData(
      namespace: Namespace.DC,
      name: 'creator',
      value: author,
      others: {'id': uid.toString()},
    );

    if (fileAs != null && fileAs.isNotEmpty) {
      addMetaData(
        namespace: null,
        name: 'meta',
        value: fileAs,
        others: {
          'refines': '#$uid',
          'property': 'file-as',
          'scheme': 'marc:relators',
        },
      );
    }

    if (role != null && role.isNotEmpty) {
      addMetaData(
        namespace: null,
        name: 'meta',
        value: role,
        others: {
          'refines': '#$uid',
          'property': 'role',
          'scheme': 'marc:relators',
        },
      );
    }
  }

  /// Set document cover
  void setCover(String filename, List<int> content) {
    final item = EpubCover(filename: filename, content: content);
    addItem(item);

    addMetaData(
      namespace: null,
      name: 'meta',
      value: '',
      others: {'name': 'cover', 'content': 'cover-img'},
    );
  }

  /// Add another value to [namespace] and [name]
  void addMetaData({
    required Namespace? namespace,
    required String name,
    required String value,
    Map<String, String>? others,
  }) {
    String? ns = namespace == null || !namespaces.containsKey(namespace.name)
        ? namespace?.name
        : namespaces[namespace.name]!;

    if (!metadata.containsKey(ns)) {
      metadata[ns] = {};
    }

    if (!metadata[ns]!.containsKey(name)) {
      metadata[ns]![name] = [];
    }

    metadata[ns]![name]!.add(Tuple2(value, others ?? {}));
  }

  /// set and override existing value in [namespace] and [name]
  void setMetaData({
    required Namespace? namespace,
    required String name,
    required String value,
    Map<String, String>? others,
  }) {
    String? ns = namespace == null || !namespaces.containsKey(namespace.name)
        ? namespace?.name
        : namespaces[namespace.name]!;

    if (metadata.containsKey(ns) && metadata[ns]!.containsKey(name)) {
      metadata[ns]![name] = [Tuple2(value, others ?? {})];
    } else {
      addMetaData(
        namespace: namespace,
        name: name,
        value: value,
        others: others,
      );
    }
  }

  /// Add an item to the book
  ///
  /// [mediatype] and [uid] is set automatically
  /// if not defined
  void addItem(EpubItem item) {
    if (item.mediatype.isEmpty) {
      final mimetype = mime.lookupMimeType(item.filename);
      item.mediatype = mimetype ?? 'application/octet-stream';
    }

    if (item.uid == null || item.uid!.isEmpty) {
      if (item is EpubHtml) {
        item.uid = 'chapter_${_htmlId++}';
        // TODO extend pages
      } else if (item is EpubImage) {
        item.uid = 'image_${_imageId++}';
      } else {
        item.uid = 'statis_${_staticId++}';
      }
    }

    item.book = this;
    items.add(item);
  }
}
