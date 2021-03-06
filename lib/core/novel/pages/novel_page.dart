import 'dart:math' as math;

import 'package:chapturn_browser_extension/core/novel/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/widget_constants.dart';
import '../../../widgets/key_value_tile.dart';
import '../../../widgets/modal_card.dart';
import '../widgets/about_novel_card.dart';
import '../widgets/chapters_card.dart';
import '../widgets/novel_card.dart';
import '../widgets/packaging_card.dart';
import '../widgets/source_unsupported_card.dart';

class NovelPage extends HookConsumerWidget {
  const NovelPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(crawlerController.notifier).load();
    }, []);

    final crawlerState = ref.watch(crawlerController);

    return crawlerState.map(
      loading: (state) => ModalCard.forceCentered(child: const LoadingCard()),
      fetching: (state) => FetchingView(url: state.url),
      data: (state) => const CrawlerLoadedView(),
      unsupported: (state) => SourceUnsupportedCard(state.url, state.meta),
      error: (state) => Center(child: Text(state.toString())),
      supported: (state) => const Center(child: Text('Supported')),
    );
  }
}

class FetchingView extends StatelessWidget {
  const FetchingView({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    final uri = Uri.parse(url);

    return ModalCard.forceCentered(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const LoadingCard(heading: 'Fetching...'),
          const SizedBox(height: kNormalPadding),
          ModalCard(
            heading: uri.host,
            headingIcon: const Icon(Icons.web_asset),
            children: [
              KeyValueTile('Path', uri.path),
              if (uri.hasQuery) ...[
                const SizedBox(height: kContentPadding),
                KeyValueTile('Query', uri.query),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class CrawlerLoadedView extends StatelessWidget {
  const CrawlerLoadedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  SizedBox(height: kNormalPadding),
                  PackagingCard(),
                  SizedBox(height: kNormalPadding),
                  ChaptersCard()
                ],
              ),
            ),
            const SizedBox(width: kNormalPadding),
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
