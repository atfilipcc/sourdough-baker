import 'package:flutter/foundation.dart';
import 'dart:async';

class TimerModel extends ChangeNotifier {
  Duration _remainingTime;
  Timer _timerInstance;
  int _timerInterval;
  final Duration _finished = Duration(hours: 0, minutes: 0, seconds: 0);

  void startTimer() {
    setRemainingTime(_remainingTime);
    _timerInterval = 1;
    if (_timerInstance != null) {
      _timerInstance.cancel();
    }
    _timerInstance = new Timer.periodic(
      Duration(seconds: _timerInterval),
      (t) {
        if (_remainingTime == _finished) {
          _timerInterval = 0;
        } else {
          _updateRemainingTime();
        }
      },
    );
  }

  void pauseTimer() {
    if (_timerInstance != null) {
      _timerInstance.cancel();
    }
  }

  String getRemainingTime() {
    if (_remainingTime == _finished) {
      return 'Done!';
    }
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

  Duration getDuration() => _remainingTime;

  void _updateRemainingTime() {
    if (_remainingTime != null) {
      _remainingTime = Duration(seconds: _remainingTime.inSeconds - 1);
    }
    notifyListeners();
  }

  void setRemainingTime(Duration newValue) {
    _remainingTime = newValue;
  }
}
