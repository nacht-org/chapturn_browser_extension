import 'package:chapturn_browser_extension/constants/widget_constants.dart';
import 'package:chapturn_browser_extension/core/desktop/pages/desktop.dart';
import 'package:chapturn_browser_extension/core/popup/pages/popup.dart';
import 'package:chapturn_browser_extension/utils/services/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'utils/services/browser_service/browser_service.dart';

void main() {
  runApp(const MyApp());
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
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kRadius),
            ),
          ),
        ),
        home: Consumer(builder: (context, ref, child) {
          final browserService = ref.watch(browserServiceProvider);

          switch (browserService.runtimeMode) {
            case BrowserRuntimeMode.popup:
              return const PopupHome();
            case BrowserRuntimeMode.tab:
              return const DesktopHome();
          }
        }),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
