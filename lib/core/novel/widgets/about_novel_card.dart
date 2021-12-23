import 'package:chapturn_sources/models/novel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../notifiers/novel_notifier.dart';

class AboutNovelCard extends StatelessWidget {
  const AboutNovelCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var novel = context.select<NovelNotifier, Novel?>((n) => n.novel)!;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About this',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 12.0),
            ...buildDescription(context, novel),
            ...buildGenres(context, novel),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text('Show More'),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> buildDescription(BuildContext context, Novel novel) {
    const smallBox = SizedBox(height: 4.0);

    List<Widget> description = [];
    if (novel.description.isNotEmpty) {
      description = [
        Text(
          'Description',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        smallBox,
        for (var p in novel.description) ...[smallBox, Text(p)],
      ];
    }

    return description;
  }

  List<Widget> buildGenres(BuildContext context, Novel novel) {
    List<Widget> widgets = [];
    var genres =
        novel.metadata.where((element) => element.name == 'subject').toList();
    if (genres.isNotEmpty) {
      widgets = [
        const SizedBox(height: 8.0),
        Text(
          'Genres',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(height: 8.0),
        Wrap(
          spacing: 4.0,
          runSpacing: 4.0,
          children: List.generate(
            genres.length,
            (index) => Chip(
              label: Text(genres[index].value),
            ),
          ),
        ),
      ];
    }

    return widgets;
  }
}
