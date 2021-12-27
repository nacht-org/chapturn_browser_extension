import 'package:chapturn_webext/core/alert/models/alert_model.dart';
import 'package:chapturn_webext/core/alert/widgets/alert_listener.dart';
import 'package:chapturn_webext/core/novel/models/novel_model.dart';
import 'package:chapturn_webext/utils/injection.dart';
import 'package:chapturn_webext/utils/services/package_service.dart';
import 'package:chapturn_webext/utils/services/browser_service/browser_service.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

import 'core/novel/pages/novel_page.dart';

void main() {
  configureInjection(kReleaseMode ? Environment.prod : Environment.dev);

  final browser = getIt.get<BrowserService>();
  if (browser.runtimeMode == BrowserRuntimeMode.popup) {
    browser.openTabWindow();
  } else {
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AlertModel(),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => NovelModel(
              alert: context.read<AlertModel>(),
              packager: getIt.get<Packager>(instanceName: 'EpubPackager'),
              browser: getIt.get<BrowserService>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Chapturn Extension',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            cardTheme: CardTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          home: const Home(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertListener(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Chapturn'),
        ),
        body: const NovelPage(),
      ),
    );
  }
}
