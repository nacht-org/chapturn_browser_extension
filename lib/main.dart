import 'package:flutter/material.dart';
import 'dart:html' as html;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: 24.0,
          horizontal: MediaQuery.of(context).size.width * 0.06,
        ),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 324,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              AspectRatio(
                                aspectRatio: 2 / 3,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/images/abstract.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Some where nice, novel',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                      const SizedBox(height: 12.0),
                                      Text(
                                        'by bludeauth',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                      const SizedBox(height: 8.0),
                                      Text('Completed • 8 chapters'),
                                      const SizedBox(height: 8.0),
                                      Text('English'),
                                      const Spacer(),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text('Download as epub'),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              '8 chapters',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          CheckboxListTile(
                            title: Text('Chapter 1'),
                            subtitle: Text('unknown'),
                            secondary: Icon(Icons.download_done),
                            value: false,
                            onChanged: (value) {},
                          ),
                          CheckboxListTile(
                            title: Text('Chapter 1'),
                            subtitle: Text(
                              '14/12/2020',
                            ),
                            secondary: Icon(Icons.downloading),
                            value: false,
                            onChanged: (value) {},
                          ),
                          CheckboxListTile(
                            title: Text('Chapter 1'),
                            subtitle: Text(
                              '14/12/2020',
                            ),
                            secondary: Icon(Icons.download),
                            value: false,
                            onChanged: (value) {},
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'About this',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            const SizedBox(height: 12.0),
                            Text(
                              'Description',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eget ligula augue. Integer ligula risus, suscipit ut risus nec, interdum fermentum ante. Aliquam tempor erat.',
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Genres',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            const SizedBox(height: 4.0),
                            Wrap(
                              children: [Chip(label: Text('Fantasy'))],
                            ),
                            Center(
                              child: TextButton(
                                onPressed: () {},
                                child: const Text('Show More'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
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
