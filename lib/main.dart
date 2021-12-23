import 'package:chapturn_browser_extension/core/novel/notifiers/novel_notifier.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NovelNotifier(
            'https://www.scribblehub.com/series/180910/the-immortal-witchs-death-wish/',
          ),
        )
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
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chapturn'),
      ),
      body: NovelPage(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Book',
            icon: Icon(Icons.book),
          ),
          BottomNavigationBarItem(
            label: 'Browse',
            icon: Icon(Icons.compass_calibration),
          ),
          BottomNavigationBarItem(
            label: 'More',
            icon: Icon(Icons.more_horiz),
          ),
        ],
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      ),
    );
  }
}
