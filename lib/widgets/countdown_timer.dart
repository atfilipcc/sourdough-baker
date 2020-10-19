import 'package:flutter/material.dart';
import 'dart:async';
import '../models/timer_model.dart';
import 'package:provider/provider.dart';

class CountdownTimer extends StatefulWidget {
  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  Timer _timerInstance;

  bool _isPaused = false;
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

  void unpauseTimer() => startTimer();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 32),
          Consumer<TimerModel>(
            builder: (context, data, child) {
              return Text(
                data.getRemainingTime()?.toString() ?? '',
                style: TextStyle(
                    fontSize: 48,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              );
            },
          ),
          FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  if (_isPaused) {
                    _isPaused = false;
                    unpauseTimer();
                  } else {
                    _isPaused = true;
                    pauseTimer();
                  }
                });
              },
              icon: Icon(_isPaused ? Icons.play_arrow : Icons.pause),
              label: Text(_isPaused ? "Resume" : "Pause")),
        ],
      ),
    );
  }
}
