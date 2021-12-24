import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../notifiers/novel_notifier.dart';

class PackagingCard extends StatelessWidget {
  const PackagingCard({
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
            child: Text('Downloading & Packaging',
                style: Theme.of(context).textTheme.headline6),
          ),
          buildDownloadTile(notifier),
          Selector<NovelNotifier, PackagingState>(
            selector: (context, notifier) => notifier.packagingState,
            builder: (context, state, child) {
              return ListTile(
                title: const Text('Package'),
                subtitle: Text(state.message),
                leading: const Icon(Icons.book),
                onTap: notifier.packEpub,
              );
            },
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget buildDownloadTile(NovelNotifier notifier) {
    Icon? icon;
    String status;
    switch (notifier.state) {
      case NovelNotifierState.loading:
      case NovelNotifierState.notSupported:
      case NovelNotifierState.idle:
        status = 'Idle';
        break;
      case NovelNotifierState.downloading:
        status = 'In progress: ${notifier.value} of ${notifier.total}';
        icon = Icon(Icons.downloading);
        break;
    }

    return ListTile(
      title: const Text('Download'),
      subtitle: Text(status),
      leading: const Icon(Icons.download),
      trailing: icon,
      onTap: notifier.isDownloading ? null : notifier.waitDownload,
    );
  }
}
