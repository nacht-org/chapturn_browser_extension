import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/novel_model.dart';

class PackagingCard extends StatelessWidget {
  const PackagingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _model = context.read<NovelModel>();

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('Downloading & Packaging',
                style: Theme.of(context).textTheme.headline6),
          ),
          Consumer<NovelModel>(
            builder: (context, model, child) => buildDownloadTile(model),
          ),
          Selector<NovelModel, PackagingState>(
            selector: (context, notifier) => notifier.packagingState,
            builder: (context, state, child) {
              return ListTile(
                title: const Text('Package'),
                subtitle: Text(state.message),
                leading: const Icon(Icons.book),
                onTap: _model.packEpub,
              );
            },
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget buildDownloadTile(NovelModel model) {
    Icon? icon;
    String status;
    switch (model.state) {
      case NovelModelState.loading:
      case NovelModelState.notSupported:
      case NovelModelState.idle:
        status = model.pendingDownload().isEmpty ? 'Completed' : 'Idle';
        break;
      case NovelModelState.downloading:
        status = 'In progress: ${model.value} of ${model.total}';
        icon = Icon(Icons.downloading);
        break;
    }

    return ListTile(
      title: const Text('Download'),
      subtitle: Text(status),
      leading: const Icon(Icons.download),
      trailing: icon,
      onTap: model.isDownloading ? null : model.waitDownload,
    );
  }
}
