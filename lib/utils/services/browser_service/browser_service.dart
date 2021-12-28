import 'package:injectable/injectable.dart';
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

@Environment(Environment.prod)
@Injectable(as: BrowserService)
class BrowserServiceProd implements BrowserService {
  @override
  BrowserRuntimeMode get runtimeMode => pRuntimeMode();

  @override
  Future<String> get href => pHref();

  @override
  Future<void> openTabWindow() => pOpenTabWindow();
}

@Environment(Environment.dev)
@Injectable(as: BrowserService)
class BrowserServiceDev implements BrowserService {
  @override
  BrowserRuntimeMode get runtimeMode => BrowserRuntimeMode.tab;

  @override
  Future<String> get href async =>
      'https://www.webnovel.com/book/cultivating-disciples-to-breakthrough_19477270406566505';

  @override
  Future<void> openTabWindow() async {}
}
