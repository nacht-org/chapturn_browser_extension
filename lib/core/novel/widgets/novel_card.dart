import 'package:chapturn_browser_extension/core/novel/providers.dart';
import 'package:chapturn_sources/chapturn_sources.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/widget_constants.dart';

class NovelCard extends ConsumerWidget {
  const NovelCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crawlerNotifier = ref.read(crawlerNotifierProvider.notifier);
    final crawlerData = ref.watch(crawlerDataProvider);

    final novel = crawlerData.value!.novel;

    return SizedBox(
      height: 340,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 2 / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: novel.thumbnailUrl == null
                      ? Image.asset(
                          'assets/images/book-thumbnail.png',
                          fit: BoxFit.cover,
                          semanticLabel: 'Novel thumbnail placeholder',
                        )
                      : FadeInImage.assetNetwork(
                          placeholder: 'assets/images/book-thumbnail.png',
                          image: novel.thumbnailUrl!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          novel.title,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        IconButton(
                          onPressed: crawlerNotifier.reload,
                          icon: const Icon(Icons.refresh),
                          tooltip: 'Reload novel',
                          splashRadius: cSplashRadius,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      'by ${novel.author ?? "❔"}',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                        '${novel.status ?? "Unknown"} • ${novel.chapterCount()} chapters'),
                    const SizedBox(height: 8.0),
                    Chip(
                      label: Text(novel.lang),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: const [
                        IconButton(
                          onPressed: null,
                          icon: Icon(Icons.library_add),
                          tooltip: 'Add to library',
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
