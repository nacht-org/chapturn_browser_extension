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
    var model = context.watch<NovelModel>();

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
          if (model.volumes.isNotEmpty)
            for (var ci in model.volumes.values.first.chapters.values)
              ChangeNotifierProvider.value(
                value: ci,
                child: ChapterTile(model),
              ),
          const SizedBox(height: 12),
        ],
      ),
    );
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
