import 'package:flutter/foundation.dart';

class TimerModel extends ChangeNotifier {
  Duration _remainingTime;

  String getRemainingTime() {
    return [
      _remainingTime?.inHours,
      _remainingTime?.inMinutes,
      _remainingTime?.inSeconds
    ]
        .map((timeArr) => timeArr == null
            ? ''
            : timeArr.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }

  void updateRemainingTime() {
    if (_remainingTime != null) {
      _remainingTime = Duration(seconds: _remainingTime.inSeconds - 1);
    }
    notifyListeners();
  }

  void setRemainingTime(Duration newValue) {
    _remainingTime = newValue;
    notifyListeners();
  }
}
