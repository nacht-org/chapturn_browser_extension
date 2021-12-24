const namespaces = {
  'XML': 'http://www.w3.org/XML/1998/namespace',
  'EPUB': 'http://www.idpf.org/2007/ops',
  'DAISY': 'http://www.daisy.org/z3986/2005/ncx/',
  'OPF': 'http://www.idpf.org/2007/opf',
  'CONTAINERNS': 'urn:oasis:names:tc:opendocument:xmlns:container',
  'DC': 'http://purl.org/dc/elements/1.1/',
  'XHTML': 'http://www.w3.org/1999/xhtml'
};

// xml templates

const containerPath = 'META-INF/container.xml';

const containerXml = '''<?xml version='1.0' encoding='utf-8'?>
<container xmlns="urn:oasis:names:tc:opendocument:xmlns:container" version="1.0">
  <rootfiles>
    <rootfile media-type="application/oebps-package+xml" full-path="%s/content.opf"/>
  </rootfiles>
</container>
''';

const ncxXml =
    '''<!DOCTYPE ncx PUBLIC "-//NISO//DTD ncx 2005-1//EN" "http://www.daisy.org/z3986/2005/ncx-2005-1.dtd">
<ncx xmlns="http://www.daisy.org/z3986/2005/ncx/" version="2005-1" />''';

const navXml =
    '''<?xml version="1.0" encoding="utf-8"?><!DOCTYPE html><html xmlns="http://www.w3.org/1999/xhtml" xmlns:epub="http://www.idpf.org/2007/ops"/>''';

const chapterXml =
    '''<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE html><html xmlns="http://www.w3.org/1999/xhtml" xmlns:epub="http://www.idpf.org/2007/ops"  epub:prefix="z3998: http://www.daisy.org/z3998/2012/vocab/structure/#"></html>''';
