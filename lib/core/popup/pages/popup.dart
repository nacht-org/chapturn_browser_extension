import 'package:chapturn_browser_extension/constants/widget_constants.dart';
import 'package:chapturn_browser_extension/core/novel/providers.dart';
import 'package:chapturn_browser_extension/core/popup/widgets/crawler_card.dart';
import 'package:chapturn_browser_extension/widgets/modal_card.dart';
import 'package:chapturn_sources/src/models/meta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PopupHome extends HookConsumerWidget {
  const PopupHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(crawlerController.notifier).load(fetch: false);
    }, []);

    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        titleTextStyle: theme.textTheme.headline6?.copyWith(
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: theme.colorScheme.onSurface,
        ),
        elevation: 0,
        title: const Text('Chapturn'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.brightness_auto),
            splashRadius: kSplashRadius,
            tooltip: 'Switch theme',
          ),
          const SizedBox(width: kContentPadding),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
            splashRadius: kSplashRadius,
            tooltip: 'Open settings',
          ),
        ],
      ),
      body: const SafeArea(child: PopupView()),
    );
  }
}

class PopupView extends ConsumerWidget {
  const PopupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crawlerState = ref.watch(crawlerController);

    return crawlerState.when(
      loading: () => const LoadingCard(),
      fetching: (url, meta) => const LoadingCard(
        heading: 'Fetching...',
      ),
      data: (meta, crawler, novel) => Container(),
      supported: (url, meta) {
        return SupportedCard(url, meta);
      },
      unsupported: (url, meta) => const Text('Unsupported'),
      error: (e) => Text(e.toString()),
    );
  }
}

class SupportedCard extends StatelessWidget {
  const SupportedCard(
    this.url,
    this.meta, {
    Key? key,
  }) : super(key: key);

  final String url;
  final Meta meta;

  @override
  Widget build(BuildContext context) {
    final uri = Uri.parse(url);

    return Card(
      margin: const EdgeInsets.all(kNormalPadding),
      child: Padding(
        padding: const EdgeInsets.all(kNormalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  uri.host,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
            Text(
              'This site is supported',
              style: Theme.of(context).textTheme.caption,
            ),
            const SizedBox(height: kContentPadding),
            Wrap(
              spacing: kChipSpacing,
              children: [
                Chip(label: Text(meta.lang)),
                for (var dir in meta.readingDirections)
                  Chip(label: Text(dir.name)),
                Chip(label: Text(meta.updated.toString())),
              ],
            ),
            const SizedBox(height: kNormalPadding),
            Text(
              'Actions',
              style: Theme.of(context).textTheme.overline,
            ),
            const SizedBox(height: kContentPadding),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.web),
              title: Text('Continue'),
              dense: true,
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.tab),
              title: Text('Open in tab mode'),
              dense: true,
            ),
            const SizedBox(height: kContentPadding),
            Text(
              'Options',
              style: Theme.of(context).textTheme.overline,
            ),
            const SizedBox(height: kContentPadding),
            CheckboxListTile(
              value: false,
              onChanged: (value) {},
              title: const Text('Remember my choice'),
              dense: true,
            ),
          ],
        ),
      ),
    );
  }
}
