import 'package:chapturn_browser_extension/constants/widget_constants.dart';
import 'package:chapturn_browser_extension/core/novel/providers.dart';
import 'package:chapturn_browser_extension/widgets/modal_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CrawlerCard extends ConsumerWidget {
  const CrawlerCard({Key? key}) : super(key: key);
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
        final uri = Uri.parse(url);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const Icon(Icons.check),
                    title: Text(uri.host),
                    subtitle: Text('This site is supported'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Fetch'),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('Open in Tab'),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const SizedBox(
                    height: kRadius,
                  )
                ],
              ),
            ),
          ],
        );
      },
      unsupported: (url, meta) => const Text('Unsupported'),
      error: (e) => Text(e.toString()),
    );
  }
}
