// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:chapturn_webext/external/js/js.dart' as popup;
import 'package:js/js_util.dart';

import 'enums.dart';

BrowserRuntimeMode pRuntimeMode() {
  final search = window.location.search;

  if (search == null || search.trim().isEmpty) {
    return BrowserRuntimeMode.popup;
  } else {
    return BrowserRuntimeMode.tab;
  }
}

Future<String> pHref() async {
  switch (pRuntimeMode()) {
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

Future<void> pOpenTabWindow() {
  return popup.openTabWindow();
}
