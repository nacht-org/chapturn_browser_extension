import 'package:archive/archive.dart';
import 'package:chapturn_browser_extension/utils/epub/constants.dart';
import 'package:chapturn_browser_extension/utils/epub/models.dart';
import 'package:chapturn_sources/models/metadata.dart';
import 'package:sprintf/sprintf.dart';
import 'dart:convert' as convert;

import 'package:xml/xml.dart';

extension ToArchive on String {
  ArchiveFile inPath(String name, [int? compressionType = ArchiveFile.STORE]) {
    final content = convert.utf8.encode(this);
    return ArchiveFile(name, content.length, content, compressionType);
  }
}

class EpubWriterOptions {
  bool epub2Guide;
  bool epub3Landmark;
  bool epub3Pages;
  String landmarkTitle;
  String pagesTitle;
  bool spineDirection;
  bool packageDirection;
  DateTime? mtime;
  Function(EpubBook)? beforeWrite;
  EpubPlayOrder playOrder;

  EpubWriterOptions({
    this.epub2Guide = true,
    this.epub3Landmark = true,
    this.epub3Pages = true,
    this.landmarkTitle = 'Guide',
    this.pagesTitle = 'Pages',
    this.spineDirection = true,
    this.packageDirection = false,
    this.mtime,
    this.beforeWrite,
    EpubPlayOrder? playOrder,
  }) : playOrder = playOrder ?? EpubPlayOrder();
}

class EpubPlayOrder {
  bool enabled;
  int startFrom;

  EpubPlayOrder({
    this.enabled = false,
    this.startFrom = 1,
  });

  EpubPlayOrder clone() {
    return EpubPlayOrder(enabled: enabled, startFrom: startFrom);
  }
}

class EpubWriter {
  String filename;
  EpubBook book;
  EpubWriterOptions options;

  Archive archive;
  late EpubPlayOrder playOrder;

  EpubWriter(
    this.filename,
    this.book, {
    EpubWriterOptions? options,
  })  : options = options ?? EpubWriterOptions(),
        archive = Archive() {
    playOrder = this.options.playOrder.clone();
  }

  void process() {
    // plugin
    if (options.beforeWrite != null) {
      options.beforeWrite!(book);
    }

    // TODO: implement html before write
  }

  void _writeContainer() {
    final xml = sprintf(containerXml, [EpubBook.folderName]);
    archive.addFile(xml.inPath(containerPath));
  }

  void _writeOpfMetaData(XmlBuilder root) {
    final nsmap = {
      'dc': namespaces['DC']!,
      'OPF': namespaces['OPF']!,
      ...book.namespaces,
    };

    root.element('metadata', nest: () {
      nsmap.forEach(root.attribute);

      root.element('meta', nest: () {
        root.attribute('property', 'dcterms:modified');
        root.text((options.mtime ?? DateTime.now()).toString());
      });

      for (var entry in book.metadata.entries) {
        final ns = entry.key;
        if (ns == namespaces[Namespace.OPF]) {
          // OPFs
          for (var values in entry.value.values) {
            for (var v in values) {
              if (v.item2.containsKey('property') &&
                  v.item2['property'] == 'dcterms:modified') {
                continue;
              }

              try {
                root.element('meta', nest: () {
                  v.item2.forEach(root.attribute);
                  if (v.item1.isNotEmpty) root.text(v.item1);
                });
              } catch (e) {
                print(e);
              }
            }
          }
        } else {
          // DC and others
          for (var nameEntry in entry.value.entries) {
            final name = ns == null ? nameEntry.key : '{$ns}${nameEntry.key}';
            for (var v in nameEntry.value) {
              root.element(name, nest: () {
                v.item2.forEach(root.attribute);
                root.text(v.item1);
              });
            }
          }
        }
      }
    });
  }

  String? _writeOpfManifest(XmlBuilder root) {
    String? ncxId;

    root.element('manifest', nest: () {
      for (var item in book.items) {
        if (!item.manifest) {
          continue;
        }

        if (item is EpubNav) {
          root.element('item', nest: () {
            root.attribute('href', item.filename);
            root.attribute('id', item.uid.toString());
            root.attribute('media-type', item.mediatype);
            root.attribute('properties', 'nav');
          });
        } else if (item is EpubNcx) {
          ncxId = item.uid;
          root.element('item', nest: () {
            root.attribute('href', item.filename);
            root.attribute('id', item.uid.toString());
            root.attribute('media-type', item.mediatype);
          });
        } else if (item is EpubCover) {
          root.element('item', nest: () {
            root.attribute('href', item.filename);
            root.attribute('id', item.uid.toString());
            root.attribute('media-type', item.mediatype);
            root.attribute('properties', 'cover-image');
          });
        } else {
          final opts = {
            'href': item.filename,
            'id': item.uid!,
            'media-type': item.mediatype,
          };

          root.element('item', nest: () {
            opts.forEach(root.attribute);
          });
        }
      }
    });

    return ncxId;
  }

  void _writeOpfSpine(XmlBuilder root, String? ncxId) {
    root.element('spine', nest: () {
      root.attribute('toc', ncxId ?? 'ncx');
      if (options.spineDirection) {
        root.attribute('page-progression-direction', book.direction);
      }

      var isLinear = true;

      // reference elements
      for (var item in book.spine) {
        root.element('itemref', nest: () {
          root.attribute('idref', item.uid.toString());
          if (!item.isLinear || !isLinear) {
            root.attribute('linear', 'no');
          }
        });
      }
    });
  }

  void _writeOpfGuide(XmlBuilder root) {
    if (book.guide.isEmpty || !options.epub2Guide) {
      return;
    }

    root.element('guide', nest: () {
      for (var item in book.guide) {
        root.element('reference', nest: () {
          item.asMap().forEach(root.attribute);
        });
      }
    });
  }

  void _writeOpfBindings(XmlBuilder root) {
    if (book.bindings.isEmpty) {
      return;
    }

    root.element('bindings', nest: () {
      for (var item in book.bindings) {
        root.element('mediaType', nest: () {
          item.forEach(root.attribute);
        });
      }
    });
  }

  void _writeOpf() {
    final packageAttributes = {
      'xmlns': namespaces['OPF']!,
      'unique-identifier': EpubBook.identifierId,
      'version': '3.0'
    };

    if (options.packageDirection) {
      packageAttributes['dir'] = book.direction.value;
    }

    final root = XmlBuilder();
    root.element('package', nest: () {
      packageAttributes.forEach(root.attribute);

      final prefixes = ['rendition: http://www.idpf.org/vocab/rendition/#']
        ..addAll(book.prefixes);
      root.attribute('prefix', prefixes.join(' '));

      // Metadata
      _writeOpfMetaData(root);

      // Manifest
      final ncxId = _writeOpfManifest(root);

      // Spine
      _writeOpfSpine(root, ncxId);

      // Guide
      _writeOpfGuide(root);

      // Bindings
      _writeOpfBindings(root);

      // Write
    });

    final xml = root.buildDocument().toXmlString(pretty: true);
    archive.addFile(xml.inPath('${EpubBook.folderName}/content.opf'));
  }

  void _addPlayOrder(XmlBuilder builder) {
    if (!playOrder.enabled) {
      return;
    }

    builder.attribute('playOrder', playOrder.startFrom);
    playOrder.startFrom++;
  }

  void _createLink(XmlNode node, XmlBuilder builder, Link link) {
    var _contents = node.findElements('content').toList();
    if (_contents.isNotEmpty) {
      var src = _contents[0].getAttribute('src');
      if (src == null || src.isEmpty) {
        _contents[0].setAttribute('src', link.href);
      }
    }

    builder.element('navPoint', nest: () {
      builder.attribute('id', link.uid.toString());
      _addPlayOrder(builder);

      builder.element('navLabel', nest: () {
        builder.element('text', nest: () {
          builder.text(link.title);
        });
      });
    });
  }

  int _createSection(
    XmlNode node,
    List<NavItem> items,
    int uid, {
    bool fragment = false,
  }) {
    for (var item in items) {
      final builder = XmlBuilder();
      var childNode;
      if (item is Section) {
        builder.element('navPoint', nest: () {
          builder.attribute('id', 'sep_$uid');
          _addPlayOrder(builder);

          builder.element('navLabel', nest: () {
            builder.element('text', nest: () {
              builder.text(item.title);
            });
          });

          builder.element('content', attributes: {'src': item.href});

          childNode = builder.buildFragment();
          uid = _createSection(childNode, item.items, uid + 1, fragment: true);
        });
      } else if (item is Flat) {
        for (var chapter in item.items) {
          _createLink(node, builder, Link.html(chapter));
        }
      } else if (item is Link) {
        _createLink(node, builder, item);
      }

      childNode ??= builder.buildFragment();
      node.children.add(childNode);
    }

    return uid;
  }

  String _getNcx() {
    final tree = XmlDocument.parse(ncxXml);
    final root = tree.rootElement;

    // head
    final head = XmlBuilder();
    head.element('head', nest: () {
      head.element('meta',
          attributes: {'content': book.uid.toString(), 'name': 'dtb:uid'});
      head.element('meta', attributes: {'content': '0', 'name': 'dtb:depth'});
      head.element('meta',
          attributes: {'content': '0', 'name': 'dtb:totalPageCount'});
      head.element('meta',
          attributes: {'content': '0', 'name': 'dtb:maxPageNumber'});
    });
    root.children.add(head.buildFragment());

    // docTitle
    final docTitle = XmlBuilder();
    docTitle.element('docTitle', nest: () {
      docTitle.element('text', nest: () {
        docTitle.text(book.title);
      });
    });
    root.children.add(docTitle.buildFragment());

    // navMap
    final builder = XmlBuilder();
    builder.element('navMap');

    final navMap = builder.buildFragment();
    _createSection(navMap.firstChild!, book.toc, 0);
    root.children.add(navMap);

    return root.toXmlString(pretty: true);
  }

  String _getNav(EpubHtml item) {
    final tree = XmlDocument.parse(navXml);
    final root = tree.rootElement;
    root.setAttribute('lang', book.lang);
    root.setAttribute('{${namespaces["XML"]}}lang', book.lang);

    // nav dir name

    // head
    final head = XmlBuilder();
    head.element('head', nest: () {
      head.element('title', nest: () {
        head.text(book.title);
      });

      for (var link in item.links) {
        head.element('link', attributes: {
          'href': link['href'] ?? '',
          'rel': 'stylesheet',
          'type': 'text/css',
        });
      }
    });
    root.children.add(head.buildFragment());

    // body
    final body = XmlBuilder();
    body.element('body', nest: () {
      body.element(
        'nav',
        attributes: {
          '{${namespaces["EPUB"]}}type': 'toc',
          'id': 'id',
          'role': 'doc-toc',
        },
        nest: () {
          body.element('h2', nest: () {
            body.text(book.title);
          });
        },
      );
    });

    // TODO: Implement nav
    // TODO: Implement guides
    // TODO: Implement pagelist

    root.children.add(body.buildFragment());
    return root.toXmlString(pretty: true);
  }

  void _writeItems() {
    for (var item in book.items) {
      final filename = '${EpubBook.folderName}/${item.filename}';
      if (item is EpubNcx) {
        archive.addFile(_getNcx().inPath(filename));
      } else if (item is EpubNav) {
        archive.addFile(_getNav(item).inPath(filename));
      } else if (item.manifest) {
        archive.addFile(
          ArchiveFile(filename, item.content.length, item.content),
        );
      } else {
        archive.addFile(
          ArchiveFile(item.filename, item.content.length, item.content),
        );
      }
    }
  }

  List<int>? write() {
    archive.addFile('application/epub+zip'.inPath('mimetype'));

    _writeContainer();
    _writeOpf();
    _writeItems();

    return ZipEncoder().encode(archive);
  }
}
