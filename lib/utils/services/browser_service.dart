import 'dart:html';

import 'package:chapturn_browser_extension/external/js/popup.dart' as popup;
import 'package:injectable/injectable.dart';
import 'package:js/js_util.dart';

enum BrowserRuntimeMode {
  popup,
  tab,
}

abstract class BrowserService {
  BrowserRuntimeMode get runtimeMode;

  Future<String> get novelUrl;

  /// Relevent tab url
  Future<String> get href;

  /// Open popup in tab window
  Future<void> openTabWindow();
}

@Environment(Environment.prod)
@Injectable(as: BrowserService)
class BrowserServiceProd implements BrowserService {
  @override
  Future<String> get novelUrl => href;

  @override
  BrowserRuntimeMode get runtimeMode {
    final search = window.location.search;

    if (search == null || search.trim().isEmpty) {
      return BrowserRuntimeMode.popup;
    } else {
      return BrowserRuntimeMode.tab;
    }
  }

  @override
  Future<String> get href async {
    switch (runtimeMode) {
      case BrowserRuntimeMode.popup:
        return await promiseToFuture<String>(popup.activeUrl());
      case BrowserRuntimeMode.tab:
        final uri = Uri.parse(window.location.href);
        final tabId = uri.queryParameters['id'];
        if (tabId != null) {
          return await promiseToFuture<String>(popup.tabUrl(int.parse(tabId)));
        } else {
          return '';
        }
    }
  }

  @override
  Future<void> openTabWindow() {
    return popup.openTabWindow();
  }
}

@Environment(Environment.dev)
@Injectable(as: BrowserService)
class BrowserServiceDev implements BrowserService {
  @override
  Future<String> get novelUrl async => href;

  @override
  BrowserRuntimeMode get runtimeMode => BrowserRuntimeMode.tab;

  @override
  Future<String> get href async =>
      'https://www.scribblehub.com/series/412447/shonen-hero-system/';

  @override
  Future<void> openTabWindow() async {
    window.open(window.location.href, window.name ?? 'popup tab');
  }
}
