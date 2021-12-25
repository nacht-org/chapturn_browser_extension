import 'package:chapturn_browser_extension/core/alert/notifiers/alert_model.dart';
import 'package:chapturn_browser_extension/core/alert/widgets/alert_listener.dart';
import 'package:chapturn_browser_extension/core/novel/notifiers/novel_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/novel/pages/novel_page.dart';

void main() {
  runApp(const MyApp());
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
              'https://www.scribblehub.com/series/412447/shonen-hero-system/',
              context.read<AlertModel>(),
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
