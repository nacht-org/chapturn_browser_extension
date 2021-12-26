@JS()
library main;

import 'package:js/js.dart';
// ignore: avoid_web_libraries_in_flutter, unused_import
import 'dart:js_util';

@JS('openTabWindow')
external Future<void> openTabWindow();

@JS('activeTab')
external Future<int> activeTab();

@JS('activeUrl')
external Future<String> activeUrl();

@JS('tabUrl')
external Future<String> tabUrl(int tabId);
