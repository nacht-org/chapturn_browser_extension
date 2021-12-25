import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/chapter_model.dart';
import '../models/novel_model.dart';

class ChaptersCard extends StatelessWidget {
  const ChaptersCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NovelModel>();
    final multi = model.volumes.length > 1;

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              '${model.chapterCount} chapters',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          multi
              ? MultiVolumeView(model)
              : ChapterList(
                  model,
                  model.volumes.values.first.chapters.values.toList(),
                ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class MultiVolumeView extends StatelessWidget {
  const MultiVolumeView(this.model, {Key? key}) : super(key: key);

  final NovelModel model;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: model.volumes.length,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                isScrollable: true,
                labelColor: Theme.of(context).colorScheme.onSurface,
                tabs: model.volumes.values
                    .map((volume) => Tab(text: volume.volume.name))
                    .toList(),
              ),
            ),
            const SizedBox(height: 20),
            LimitedBox(
              maxHeight: MediaQuery.of(context).size.height,
              child: TabBarView(
                children: model.volumes.values
                    .map((v) => ChapterList(model, v.chapters.values.toList()))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChapterList extends StatelessWidget {
  const ChapterList(this.model, this.chapters, {Key? key}) : super(key: key);

  final NovelModel model;
  final List<ChapterModel> chapters;

  @override
  Widget build(BuildContext context) {
    Widget child = ListView.builder(
      itemCount: chapters.length,
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: chapters[i],
        child: ChapterTile(model),
      ),
      shrinkWrap: true,
    );

    if (chapters.length > 10) {
      child = LimitedBox(
        maxHeight: MediaQuery.of(context).size.height,
        child: child,
      );
    }

    return child;
  }
}

class ChapterTile extends StatelessWidget {
  const ChapterTile(this.novelModel, {Key? key}) : super(key: key);

  final NovelModel novelModel;

  @override
  Widget build(BuildContext context) {
    var model = context.watch<ChapterModel>();

    return CheckboxListTile(
      title: Text(model.chapter.title),
      subtitle: Text(model.chapter.updated?.toString() ?? '<unknown>'),
      secondary: Icon(tileIcon(model.tileState)),
      value: model.selected,
      onChanged: novelModel.isDownloading
          ? null
          : (value) =>
              novelModel.select(model.volume.index, model.chapter.index, value),
    );
  }

  IconData tileIcon(ChapterDownloadState state) {
    switch (state) {
      case ChapterDownloadState.pending:
        return Icons.download;
      case ChapterDownloadState.unselected:
        return Icons.cancel;
      case ChapterDownloadState.inProgress:
        return Icons.downloading;
      case ChapterDownloadState.complete:
        return Icons.download_done;
    }
  }
}
