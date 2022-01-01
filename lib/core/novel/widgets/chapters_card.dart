import 'package:chapturn_browser_extension/utils/services/chapter/models.dart';
import 'package:chapturn_browser_extension/core/novel/notifiers/download_notifier.dart';
import 'package:chapturn_browser_extension/core/novel/providers.dart';
import 'package:chapturn_browser_extension/utils/services/download/list.dart';
import 'package:chapturn_browser_extension/utils/services/download/providers.dart';
import 'package:chapturn_browser_extension/utils/services/download/state_map.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class ChaptersCard extends ConsumerWidget {
  const ChaptersCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chapterCount = ref.watch(chapterCountProvider);
    final isMulti = ref.watch(isMultiVolumeProvider);

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              '$chapterCount chapters',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          isMulti ? const MultiVolumeView() : const SingleVolumeView(),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class MultiVolumeView extends ConsumerWidget {
  const MultiVolumeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chapterCount = ref.watch(chapterCountProvider);
    final multiVolume = ref.watch(multiVolumeProvider);

    var limit = chapterCount > 40;
    Widget child = ListView.builder(
      itemCount: multiVolume.length,
      itemBuilder: (context, i) => multiVolume[i].when(
        volume: (volume) => ListTile(title: Text(volume.name)),
        chapter: (chapter) => ProviderScope(
          overrides: [
            chapterProvider.overrideWithValue(chapter),
          ],
          child: const ChapterTile(),
        ),
      ),
      shrinkWrap: !limit,
    );

    if (limit) {
      child = LimitedBox(
        maxHeight: MediaQuery.of(context).size.height,
        child: child,
      );
    }

    return child;
  }
}

class SingleVolumeView extends ConsumerWidget {
  const SingleVolumeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chapterCount = ref.watch(chapterCountProvider);
    final chapters = ref.watch(singleVolumeProvider);
    final limit = chapterCount > 40;

    Widget child = ListView.builder(
      itemCount: chapters.length,
      itemBuilder: (context, i) => ProviderScope(
        overrides: [
          chapterProvider.overrideWithValue(chapters[i]),
        ],
        child: const ChapterTile(),
      ),
      shrinkWrap: !limit,
    );

    if (limit) {
      child = LimitedBox(
        maxHeight: MediaQuery.of(context).size.height,
        child: child,
      );
    }

    return child;
  }
}

class ChapterTile extends ConsumerWidget {
  const ChapterTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chapterState = ref.watch(chapterProvider);
    final chapter = chapterState.chapter;
    final downloadState = ref.watch(chapterDownloadStateProvider(chapterState));
    final isDownloading = false;

    return CheckboxListTile(
      title: Text(chapter.title),
      subtitle: Text(chapter.updated?.toString() ?? '<unknown>'),
      secondary: Icon(tileIcon(downloadState)),
      value: chapterState.isSelected,
      onChanged: isDownloading
          ? null
          : (value) => ref
              .read(chapterListProvider.notifier)
              .toggle(chapter.index, value),
    );

    // false
    //       ? null
    //       : (value) => ref
    //           .read(chapterListProvider.notifier)
    //           .select(chapterState.volumeIndex, chapter.index, value)
  }

  IconData tileIcon(ChapterDownloadState state) {
    if (state is ChapterDownloadPending) {
      return Icons.download;
    } else if (state is ChapterDownloadSkip) {
      return Icons.cancel;
    } else if (state is ChapterDownloading) {
      return Icons.downloading;
    } else if (state is ChapterDownloadComplete) {
      return Icons.download_done;
    } else {
      return Icons.error;
    }
  }
}
