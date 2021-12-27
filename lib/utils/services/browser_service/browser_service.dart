import 'package:injectable/injectable.dart';
import 'enums.dart';

export 'browser_service_web.dart'
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
  BrowserRuntimeMode get runtimeMode => runtimeMode;

  @override
  Future<String> get href => href;

  @override
  Future<void> openTabWindow() => openTabWindow();
}

@Environment(Environment.dev)
@Injectable(as: BrowserService)
class BrowserServiceDev implements BrowserService {
  @override
  BrowserRuntimeMode get runtimeMode => BrowserRuntimeMode.tab;

  @override
  Future<String> get href async =>
      'https://www.scribblehub.com/series/269454/the-new-chimera/r';

  @override
  Future<void> openTabWindow() async {}
}
