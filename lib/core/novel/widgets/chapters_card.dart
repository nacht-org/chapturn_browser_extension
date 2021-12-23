import 'package:chapturn_browser_extension/core/novel/notifiers/chapter_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../notifiers/novel_notifier.dart';

class ChaptersCard extends StatelessWidget {
  const ChaptersCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var notifier = context.watch<NovelNotifier>();

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              '${notifier.chaptersLength} chapters',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          if (notifier.volumes.isNotEmpty)
            for (var ci in notifier.volumes[0].chapters)
              ChangeNotifierProvider.value(
                value: ci,
                child: ChapterTile(),
              ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class ChapterTile extends StatelessWidget {
  const ChapterTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ci = context.watch<ChapterNotifier>();
    var notifier = context.watch<NovelNotifier>();

    return CheckboxListTile(
      title: Text(ci.chapter.title),
      subtitle: Text(ci.chapter.updated?.toString() ?? ''),
      secondary: Icon(tileIcon(ci.tileState)),
      value: ci.selected,
      onChanged: notifier.isDownloading ? null : ci.select,
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
