import 'package:chapturn_browser_extension/constants/widget_constants.dart';
import 'package:chapturn_browser_extension/utils/services/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/alert/widgets/alert_listener.dart';
import 'core/novel/pages/novel_page.dart';
import 'utils/services/browser_service/browser_service.dart';

void main() {
  final container = ProviderContainer();
  final browser = container.read(browserServiceProvider);
  container.dispose();

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
    return ProviderScope(
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
