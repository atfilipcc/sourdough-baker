import 'package:flutter/foundation.dart';

class TimerModel extends ChangeNotifier {
  int _remainingTimeInMs;

  Duration _remainingTime;

  String getRemainingTime() => [
        _remainingTime?.inHours,
        _remainingTime?.inMinutes,
        _remainingTime?.inSeconds
      ].map((seg) => seg.remainder(60).toString().padLeft(2, '0')).join(':');

  void convertMsToTime(ms) {
    Duration duration = new Duration(milliseconds: ms.round());
    _remainingTime = duration;
  }

  updateRemainingTime() {
    _remainingTimeInMs = _remainingTimeInMs - 1000;
    convertMsToTime(_remainingTimeInMs);
    notifyListeners();
  }

  setRemainingTime(int newValue) {
    _remainingTimeInMs = newValue;
    notifyListeners();
  }
}
