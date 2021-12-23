import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../notifiers/novel_notifier.dart';

class NovelCard extends StatelessWidget {
  const NovelCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var notifier = context.watch<NovelNotifier>();
    var novel = notifier.novel!;

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
                  child: notifier.novel?.thumbnailUrl == null
                      ? Image.asset(
                          'assets/images/abstract.jpg',
                          fit: BoxFit.fill,
                        )
                      : Image.network(
                          notifier.novel!.thumbnailUrl!,
                          fit: BoxFit.fill,
                        ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notifier.novel!.title,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(height: 12.0),
                      Text(
                        'by ${novel.author ?? "❔"}',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                          '${novel.status ?? "Unknown"} • ${notifier.chaptersLength} chapters'),
                      const SizedBox(height: 8.0),
                      Text(novel.lang),
                      const Spacer(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
