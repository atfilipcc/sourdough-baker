import 'package:flutter/foundation.dart';

class TimerModel extends ChangeNotifier {
  int _remainingTimeInMs;

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

  void convertMsToTime(ms) {
    Duration duration = new Duration(milliseconds: ms.round());
    _remainingTime = duration;
  }

  void updateRemainingTime() {
    if (_remainingTimeInMs == 0) {
      return;
      // Add notification
    } else if (_remainingTimeInMs != null) {
      _remainingTimeInMs = _remainingTimeInMs - 1000;
      convertMsToTime(_remainingTimeInMs);
    }
    notifyListeners();
  }

  void setRemainingTime(int newValue) {
    _remainingTimeInMs = newValue;
    convertMsToTime(_remainingTimeInMs);
    notifyListeners();
  }
}
