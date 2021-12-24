import 'package:flutter/foundation.dart';

class Alert {
  final String message;
  Alert(this.message);
}

class AlertNotifier extends ChangeNotifier {
  Alert? alert;

  void showAlert(String message) {
    alert = Alert(message);
    notifyListeners();
  }
}
