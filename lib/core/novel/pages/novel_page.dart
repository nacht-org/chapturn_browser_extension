import 'package:chapturn_browser_extension/constants/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../models/novel_model.dart';
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
    context.read<NovelModel>().load();
  }

  @override
  Widget build(BuildContext context) {
    var tuple = context.select<NovelModel, Tuple2<NovelModelState, String?>>(
      (model) => Tuple2(model.state, model.url),
    );
    print(tuple);

    switch (tuple.item1) {
      case NovelModelState.loading:
        return buildLoading('', context);
      case NovelModelState.idle:
      case NovelModelState.downloading:
        return idleView(context);
      case NovelModelState.fetching:
        return buildLoading(
          tuple.item2 != null ? 'Fetching ' + tuple.item2! : 'Error: Empty url',
          context,
        );
      case NovelModelState.notSupported:
        return const Center(
          child: Text('Not supported'),
        );
    }
  }

  Align buildLoading(String message, BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(normalPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(width: contentPadding),
                  Text(
                    'Please wait...',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
              if (message.isNotEmpty) ...[
                const SizedBox(height: normalPadding),
                Text(
                  message,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  ListView idleView(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        vertical: 24.0,
        horizontal: listViewPadding(context),
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
                children: const [
                  AboutNovelCard(),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  double listViewPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 500) {
      return 0;
    } else if (width > 1024) {
      return (width - 1024) / 2;
    } else {
      return width * 0.06;
    }
  }
}
