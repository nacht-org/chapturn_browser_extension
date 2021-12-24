import 'package:chapturn_browser_extension/core/novel/notifiers/novel_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/about_novel_card.dart';
import '../widgets/chapters_card.dart';
import '../widgets/novel_card.dart';
import '../widgets/packaging_card.dart';

class NovelPage extends StatefulWidget {
  const NovelPage({
    Key? key,
  }) : super(key: key);

  @override
  State<NovelPage> createState() => _NovelPageState();
}

class _NovelPageState extends State<NovelPage> {
  @override
  void initState() {
    super.initState();
    context.read<NovelNotifier>().loadNovelChecked();
  }

  @override
  Widget build(BuildContext context) {
    var state = context.select<NovelNotifier, NovelNotifierState>(
        (notifier) => notifier.state);
    print(state);

    switch (state) {
      case NovelNotifierState.idle:
      case NovelNotifierState.downloading:
        return idleView(context);
      case NovelNotifierState.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case NovelNotifierState.notSupported:
        return const Center(
          child: Text('Not supported'),
        );
    }
  }

  ListView idleView(BuildContext context) {
    return ListView(
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
                children: const [
                  NovelCard(),
                  SizedBox(height: 24),
                  PackagingCard(),
                  SizedBox(height: 24),
                  ChaptersCard()
                ],
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AboutNovelCard(),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
