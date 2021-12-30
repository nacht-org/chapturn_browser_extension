import 'package:chapturn_browser_extension/core/alert/notifiers/alert_notifier.dart';
import 'package:chapturn_browser_extension/core/alert/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math' as math;

class AlertListener extends ConsumerWidget {
  const AlertListener({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AlertState>(alertProvider, (previous, next) {
      next.map(
        initial: (state) {},
        snackbar: (state) => _handleAlert(context, state.message, state.error),
      );
    });

    return child;
  }

  void _handleAlert(BuildContext context, String message, bool error) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          width: math.min(MediaQuery.of(context).size.width, 400),
        ),
      );
  }
}
