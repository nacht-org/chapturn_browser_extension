import 'package:chapturn_browser_extension/core/novel/providers.dart';
import 'package:chapturn_browser_extension/utils/helpers/text_helper.dart';
import 'package:chapturn_sources/chapturn_sources.dart' as sources;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';

class AboutNovelCard extends ConsumerWidget {
  const AboutNovelCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(crawlerDataProvider).when(
          none: () => const SizedBox(),
          data: (value) {
            final novel = value.novel;
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
                    ...buildMore(context, novel),
                    // Center(
                    //   child: TextButton(
                    //     onPressed: () {},
                    //     child: const Text('Show More'),
                    //   ),
                    // )
                  ],
                ),
              ),
            );
          },
        );
  }

  List<Widget> buildDescription(BuildContext context, sources.Novel novel) {
    const smallBox = SizedBox(height: 8.0);

    List<Widget> description = [];
    if (novel.description.isNotEmpty) {
      description = [
        Text(
          'Description',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        for (var p in novel.description) ...[smallBox, Text(p)],
      ];
    }

    return description;
  }

  List<Widget> buildGenres(BuildContext context, sources.Novel novel) {
    var genres =
        novel.metadata.where((element) => element.name == 'subject').toList();
    return genres.isEmpty ? [] : buildChips(context, 'Genres', genres);
  }

  List<Widget> buildMore(BuildContext context, sources.Novel novel) {
    List<Widget> multi = [];
    List<Widget> single = [];

    // process
    final map = <String, List<sources.MetaData>>{};
    for (var meta in novel.metadata) {
      if (meta.name == 'subject') {
        continue;
      }

      map.putIfAbsent(meta.name, () => []).add(meta);
    }

    for (var entry in map.entries) {
      if (entry.value.length == 1) {
        final meta = entry.value[0];

        single.add(
          ListTile(
            title: Text(meta.name),
            subtitle: Text(meta.value),
          ),
        );
      } else {
        multi.addAll(buildChips(context, entry.key, entry.value));
      }
    }

    return [...multi, ...single];
  }

  List<Widget> buildChips(
      BuildContext context, String heading, List<sources.MetaData> chips) {
    return [
      const SizedBox(height: 8.0),
      Text(
        capitalize(heading),
        style: Theme.of(context).textTheme.subtitle1,
      ),
      const SizedBox(height: 8.0),
      Wrap(
        spacing: 4.0,
        runSpacing: 4.0,
        children: List.generate(
          chips.length,
          (index) => Chip(
            label: Text(chips[index].value),
          ),
        ),
      ),
    ];
  }
}
