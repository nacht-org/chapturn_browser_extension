import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notifiers/alert_notifier.dart';

final alertProvider =
    StateNotifierProvider<AlertNotifier, AlertState>((ref) => AlertNotifier());
