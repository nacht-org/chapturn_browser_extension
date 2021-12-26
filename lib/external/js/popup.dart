@JS()
library main;

import 'package:js/js.dart';

@JS('openTabWindow')
external Future<void> openTabWindow();

@JS('activeTab')
external Future<int> activeTab();

@JS('activeUrl')
external Future<String> activeUrl();

@JS('tabUrl')
external Future<String> tabUrl(int tabId);
