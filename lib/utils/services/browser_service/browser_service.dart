import 'enums.dart';

import 'browser_service_web.dart'
    if (dart.library.io) 'browser_service_io.dart';

export 'enums.dart';

abstract class BrowserService {
  BrowserRuntimeMode get runtimeMode;

  /// Relevent tab url
  Future<String> get href;

  /// Open popup in tab window
  Future<void> openTabWindow();
}

class BrowserServiceProd implements BrowserService {
  @override
  BrowserRuntimeMode get runtimeMode => pRuntimeMode();

  @override
  Future<String> get href => pHref();

  @override
  Future<void> openTabWindow() => pOpenTabWindow();
}

class BrowserServiceDev implements BrowserService {
  @override
  BrowserRuntimeMode get runtimeMode => BrowserRuntimeMode.popup;

  @override
  Future<String> get href async =>
      'https://www.scribblehub.com/series/416025/legendary-side-character/';

  @override
  Future<void> openTabWindow() async {}
}
