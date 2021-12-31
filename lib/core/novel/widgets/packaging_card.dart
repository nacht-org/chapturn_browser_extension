import 'package:chapturn_browser_extension/core/novel/notifiers/download_notifier.dart';
import 'package:chapturn_browser_extension/core/novel/providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PackagingCard extends StatelessWidget {
  const PackagingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Downloading & Packaging',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          const DownloadTile(),
          const PackagingTile(),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class DownloadTile extends ConsumerWidget {
  const DownloadTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final downloadState = ref.watch(downloadNotifierProvider);

    return downloadState.map(
      idle: (state) => buildTile(ref, state, 'Idle'),
      pending: (state) => buildTile(ref, state, '${state.count} pending'),
      progress: (state) => buildTile(ref, state,
          '${state.progress} of ${state.total}', const Icon(Icons.downloading)),
      complete: (state) => buildTile(ref, state, 'Complete'),
    );
  }

  Widget buildTile(
    WidgetRef ref,
    DownloadState state,
    String status, [
    Widget? trailing,
  ]) {
    return ListTile(
      title: const Text('Download'),
      subtitle: Text(status),
      leading: const Icon(Icons.download),
      trailing: trailing,
      onTap: state is PendingDownloadState
          ? ref.read(downloadNotifierProvider.notifier).start
          : null,
    );
  }
}

class PackagingTile extends ConsumerWidget {
  const PackagingTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packagingState = ref.watch(packagingProvider);
    final isTaskRunning = ref.watch(isTaskRunningProvider);

    return packagingState.map(
      idle: (state) => buildTile(ref, 'Idle', disabled: isTaskRunning),
      waiting: (state) => buildTile(ref, 'Waiting', disabled: isTaskRunning),
      busy: (state) => buildTile(ref, 'Busy', disabled: isTaskRunning),
      preparing: (state) =>
          buildTile(ref, 'Preparing', disabled: isTaskRunning),
    );
  }

  Widget buildTile(WidgetRef ref, String message, {bool disabled = false}) {
    return ListTile(
      title: const Text('Package'),
      subtitle: Text(message),
      leading: const Icon(Icons.book),
      onTap: disabled
          ? null
          : () => ref.read(packagingProvider.notifier).package(),
    );
  }
}
