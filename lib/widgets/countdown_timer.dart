import 'package:flutter/material.dart';
import 'dart:async';
import '../models/timer_model.dart';
import 'package:provider/provider.dart';
import '../utils/constants.dart';
import 'package:flutter/cupertino.dart';

class CountdownTimer extends StatefulWidget {
  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  Timer _timerInstance;
  bool _isPaused = false;
  bool showTimer = false;
  int _timerInterval = 1;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timerInstance.cancel();
    super.dispose();
  }

  void startTimer() {
    TimerModel _timerModel = Provider.of<TimerModel>(context, listen: false);
    _timerInterval = 1;
    if (_timerInstance != null) {
      _timerInstance.cancel();
    }
    _timerInstance = new Timer.periodic(
      Duration(seconds: _timerInterval),
      (t) => setState(
        () {
          _timerModel.updateRemainingTime();
        },
      ),
    );
  }

  void pauseTimer() {
    if (_timerInstance != null) {
      _timerInstance.cancel();
      _timerInterval = 0;
    }
  }

  CupertinoTimerPicker getTimerPicker() {
    TimerModel _timerModel = Provider.of<TimerModel>(context, listen: false);
    return CupertinoTimerPicker(
      onTimerDurationChanged: (duration) =>
          _timerModel.setRemainingTime(duration),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kMainBrand,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          topLeft: Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 24.0),
          Consumer<TimerModel>(
            builder: (context, data, child) {
              return Center(
                child: Text(
                  data.getRemainingTime()?.toString() ?? '',
                  style: kTimerTextStyle,
                ),
              );
            },
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                child: Icon(
                  _isPaused ? Icons.play_arrow : Icons.pause,
                  size: 38.0,
                ),
                heroTag: 'Pause/Resume',
                tooltip: _isPaused ? 'Resume' : 'Pause',
                backgroundColor: kDarkShade,
                shape: RoundedRectangleBorder(
                  borderRadius: kBorderRadiusRoundedTop,
                ),
                onPressed: () {
                  setState(() {
                    if (_isPaused) {
                      _isPaused = false;
                      startTimer();
                    } else {
                      _isPaused = true;
                      pauseTimer();
                    }
                  });
                },
              ),
              SizedBox(width: 16.0),
              FloatingActionButton(
                child: Icon(
                  Icons.settings,
                  size: 28.0,
                ),
                tooltip: 'Set new timer',
                heroTag: 'setTimer',
                backgroundColor: kDarkShade,
                shape: RoundedRectangleBorder(
                    borderRadius: kBorderRadiusRoundedTop),
                onPressed: () {
                  setState(() {
                    if (showTimer == false) {
                      showTimer = true;
                      _isPaused = true;
                    } else {
                      showTimer = false;
                    }
                  });
                },
              ),
            ],
          ),
          showTimer
              ? Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: kBorderRadiusRoundedTop,
                  ),
                  child: Center(
                    child: getTimerPicker(),
                  ),
                )
              : SizedBox(height: 0)
        ],
      ),
    );
  }
}
