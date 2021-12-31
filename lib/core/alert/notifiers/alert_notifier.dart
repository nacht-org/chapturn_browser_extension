import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'alert_notifier.freezed.dart';

@freezed
class AlertState with _$AlertState {
  const factory AlertState.initial() = _Initial;
  const factory AlertState.snackbar(
    String message, [
    @Default(false) bool error,
  ]) = _SnackBarAlert;
}

class AlertNotifier extends StateNotifier<AlertState> {
  AlertNotifier() : super(const AlertState.initial());

  void showAlert(String message) {
    state = _SnackBarAlert(message);
  }
}
