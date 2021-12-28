import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/widget_constants.dart';
import '../../../widgets/key_value_tile.dart';
import '../../../widgets/modal_card.dart';
import '../models/crawler_model.dart';
import '../models/novel_model.dart';
import '../widgets/about_novel_card.dart';
import '../widgets/chapters_card.dart';
import '../widgets/novel_card.dart';
import '../widgets/packaging_card.dart';
import '../widgets/source_unsupported_card.dart';

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
      return ModalCard.forceCentered(child: const LoadingCard());
    } else if (state is LoadedCrawlerState) {
      return CrawlerLoadedView(state: state);
    } else if (state is NotSupportedCrawlerState) {
      return SourceUnsupportedCard(state.url, state.meta);
    } else {
      return Container();
    }
  }
}

class CrawlerLoadedView extends StatelessWidget {
  const CrawlerLoadedView({Key? key, required this.state}) : super(key: key);

  final LoadedCrawlerState state;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: state.novel,
      child: Consumer<NovelModel>(builder: (context, model, child) {
        if (model.state == NovelModelState.fetching) {
          final uri = Uri.parse(model.url);

          return ModalCard.forceCentered(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const LoadingCard(heading: 'Fetching...'),
                const SizedBox(height: cNormalPadding),
                ModalCard(
                  heading: uri.host,
                  headingIcon: const Icon(Icons.web_asset),
                  children: [
                    KeyValueTile('Path', uri.path),
                    if (uri.hasQuery) ...[
                      const SizedBox(height: cContentPadding),
                      KeyValueTile('Query', uri.query),
                    ],
                  ],
                ),
              ],
            ),
          );
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
