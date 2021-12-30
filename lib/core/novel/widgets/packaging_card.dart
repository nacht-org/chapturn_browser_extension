// import 'package:chapturn_browser_extension/core/novel/notifiers/download_notifier.dart';
// import 'package:chapturn_browser_extension/core/novel/providers.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class PackagingCard extends StatelessWidget {
//   const PackagingCard({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Text('Downloading & Packaging',
//                 style: Theme.of(context).textTheme.headline6),
//           ),
//           const DownloadTile(),
//           // Selector<NovelModel, PackagingState>(
//           //   selector: (context, notifier) => notifier.packagingState,
//           //   builder: (context, state, child) {
//           //     return ListTile(
//           //       title: const Text('Package'),
//           //       subtitle: Text(state.message),
//           //       leading: const Icon(Icons.book),
//           //       onTap: _model.packEpub,
//           //     );
//           //   },
//           // ),
//           const SizedBox(height: 12),
//         ],
//       ),
//     );
//   }
// }

// class DownloadTile extends ConsumerWidget {
//   const DownloadTile({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final downloadState = ref.watch(downloadNotifierProvider);

//     return downloadState.map(
//       idle: (state) => buildTile(ref, state, 'Idle'),
//       pending: (state) => buildTile(ref, state, '${state.count} pending'),
//       progress: (state) =>
//           buildTile(ref, state, '${state.progress} of ${state.total} left'),
//       complete: (state) => buildTile(ref, state, 'Complete'),
//     );
//   }

//   Widget buildTile(
//     WidgetRef ref,
//     DownloadState state,
//     String status, [
//     Icon? icon,
//   ]) {
//     return ListTile(
//       title: const Text('Download'),
//       subtitle: Text(status),
//       leading: const Icon(Icons.download),
//       trailing: icon,
//       onTap: state is ProgressDownloadState ? null : null,
//     );
//   }
// }
