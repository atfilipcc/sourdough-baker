import 'package:flutter/foundation.dart';

class TimerModel extends ChangeNotifier {
  final initialTime;
  TimerModel({this.initialTime});

  int _remainingTime;
  int getRemainingTime() => _remainingTime;

  updateRemainingTime() {
    _remainingTime--;
    notifyListeners();
  }
}
