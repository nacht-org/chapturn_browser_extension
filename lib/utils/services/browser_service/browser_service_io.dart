import 'browser_service.dart';

BrowserRuntimeMode pRuntimeMode() => BrowserRuntimeMode.tab;

Future<String> pHref() async =>
    'https://www.scribblehub.com/series/269454/the-new-chimera/r';

Future<void> pOpenTabWindow() async {}
