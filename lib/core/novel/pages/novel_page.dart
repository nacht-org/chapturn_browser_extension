import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/widget_constants.dart';
import '../../../utils/injection.dart';
import '../../../utils/services/package_service.dart';
import '../../alert/models/alert_model.dart';
import '../models/crawler_model.dart';
import '../models/novel_model.dart';
import '../widgets/about_novel_card.dart';
import '../widgets/chapters_card.dart';
import '../widgets/novel_card.dart';
import '../widgets/packaging_card.dart';
import '../widgets/source_no_support.dart';

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
    context.read<CrawlerModel>().load();
  }

  @override
  Widget build(BuildContext context) {
    var model = context.watch<CrawlerModel>();

    final state = model.state;
    if (state is LoadingCrawlerState) {
      return buildLoading('', context);
    } else if (state is LoadedCrawlerState) {
      return idleView(context, state);
    } else if (state is NotSupportedCrawlerState) {
      return SourceNoSupport(state.url);
    } else {
      return Container();
    }
  }

  Align buildLoading(String message, BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(cNormalPadding),
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
                  const SizedBox(width: cContentPadding),
                  Text(
                    'Please wait...',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
              if (message.isNotEmpty) ...[
                const SizedBox(height: cNormalPadding),
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

  /// TODO move to another widget
  Widget idleView(BuildContext context, LoadedCrawlerState state) {
    return ChangeNotifierProvider.value(
      value: state.novel,
      child: Consumer<NovelModel>(builder: (context, model, child) {
        if (model.state == NovelModelState.fetching) {
          return buildLoading('Fetching ${model.url}', context);
        }

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
                      SizedBox(height: cNormalPadding),
                      PackagingCard(),
                      SizedBox(height: cNormalPadding),
                      ChaptersCard()
                    ],
                  ),
                ),
                const SizedBox(width: cNormalPadding),
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
      }),
    );
  }

  double listViewPadding(BuildContext context) {
    const minWidth = 500;
    const maxWidth = 1280;
    const percent = 0.12 / 2;

    final width = MediaQuery.of(context).size.width;
    if (width < minWidth) {
      return 0;
    } else if (width < maxWidth) {
      return width * percent;
    } else {
      return math.max(width * 0.06, ((width - maxWidth) / 2));
    }
  }
}
