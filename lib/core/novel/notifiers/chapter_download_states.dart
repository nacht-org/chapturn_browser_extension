import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'download_notifier.dart';

class DownloadStatesNotifier
    extends StateNotifier<Map<int, ChapterDownloadState>> {
  DownloadStatesNotifier(Map<int, ChapterDownloadState> state) : super(state);

  void setState(int index, ChapterDownloadState downloadState) {
    state = Map.fromEntries(
      state.entries.map(
        (e) => MapEntry(e.key, e.key == index ? downloadState : e.value),
      ),
    );
  }
}
