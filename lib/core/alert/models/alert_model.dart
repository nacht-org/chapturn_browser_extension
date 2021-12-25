import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

class Alert {
  final String message;

  Alert(this.message);
}

class AlertModel extends ChangeNotifier {
  Alert? alert;

  void showAlert(String message) {
    alert = Alert(message);
    notifyListeners();
  }
}
