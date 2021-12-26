import 'package:injectable/injectable.dart';

export 'browser_service_web.dart' if (dart.library.io) '';

enum BrowserRuntimeMode {
  popup,
  tab,
}

abstract class BrowserService {
  BrowserRuntimeMode get runtimeMode;

  /// Relevent tab url
  Future<String> get href;

  /// Open popup in tab window
  Future<void> openTabWindow();
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
