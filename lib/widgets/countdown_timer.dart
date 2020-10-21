import 'package:flutter/material.dart';
import '../models/timer_model.dart';
import 'package:provider/provider.dart';
import '../utils/constants.dart';
import 'package:flutter/cupertino.dart';

class CountdownTimer extends StatefulWidget {
  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  bool _isPaused = false;
  bool showTimerPicker = false;

  @override
  void initState() {
    TimerModel _timerModel = Provider.of<TimerModel>(context, listen: false);
    print(_timerModel);
    _timerModel.startTimer();
    super.initState();
  }

  CupertinoTimerPicker getTimerPicker() {
    TimerModel _timerModel = Provider.of<TimerModel>(context, listen: false);
    return CupertinoTimerPicker(onTimerDurationChanged: (duration) {
      _timerModel.setRemainingTime(duration);
    });
  }

  @override
  Widget build(BuildContext context) {
    TimerModel _timerModel = Provider.of<TimerModel>(context, listen: false);
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
                    if (_isPaused == true) {
                      _timerModel.startTimer();
                      _isPaused = false;
                    } else {
                      _timerModel.pauseTimer();
                      _isPaused = true;
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
                    if (showTimerPicker == false) {
                      showTimerPicker = true;
                      _isPaused = true;
                      _timerModel.pauseTimer();
                    } else {
                      showTimerPicker = false;
                      _isPaused = false;
                      _timerModel.startTimer();
                    }
                  });
                },
              ),
            ],
          ),
          showTimerPicker
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
