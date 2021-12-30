import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'browser_service/browser_service.dart';
import 'package_service.dart';

final packagerServiceProvider = Provider((ref) => EpubPackager());

final browserServiceProvider = kReleaseMode
    ? Provider<BrowserService>((ref) => BrowserServiceProd())
    : Provider<BrowserService>((ref) => BrowserServiceDev());
