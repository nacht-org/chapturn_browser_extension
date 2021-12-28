import 'package:chapturn_browser_extension/constants/widget_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

import 'core/alert/models/alert_model.dart';
import 'core/alert/widgets/alert_listener.dart';
import 'core/novel/models/crawler_model.dart';
import 'core/novel/pages/novel_page.dart';
import 'utils/injection.dart';
import 'utils/services/browser_service/browser_service.dart';
import 'utils/services/package_service.dart';

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
            create: (context) => CrawlerModel(
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
                borderRadius: BorderRadius.circular(cRadius),
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
