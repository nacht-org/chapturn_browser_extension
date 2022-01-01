import 'package:chapturn_browser_extension/core/novel/notifiers/download_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'types.dart';

class DownloadStateMapNotifier extends StateNotifier<DownloadStateMap> {
  DownloadStateMapNotifier(DownloadStateMap state) : super(state);
}
