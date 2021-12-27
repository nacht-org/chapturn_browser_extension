import 'browser_service.dart';

BrowserRuntimeMode get runtimeMode => BrowserRuntimeMode.tab;

Future<String> get href async =>
    'https://www.scribblehub.com/series/269454/the-new-chimera/r';

Future<void> openTabWindow() async {}
