import 'package:flutter/material.dart';
import '../models/timer_model.dart';
import '../models/notification_model.dart';
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
  bool showPauseButton = true;

  @override
  void initState() {
    initialize();
    super.initState();
  }

  void initialize() {
    _isPaused = false;
    TimerModel _timerModel = Provider.of<TimerModel>(context, listen: false);
    NotificationModel _notificationModel =
        Provider.of<NotificationModel>(context, listen: false);
    _timerModel.startTimer();
    if (_timerModel.getDuration() != null) {
      _notificationModel.cancelNotification();
      _notificationModel.scheduleNotification(_timerModel.getDuration());
    }
  }

  void destruct() {
    _isPaused = true;
    TimerModel _timerModel = Provider.of<TimerModel>(context, listen: false);
    NotificationModel _notificationModel =
        Provider.of<NotificationModel>(context, listen: false);
    _timerModel.pauseTimer();
    _notificationModel.cancelNotification();
  }

  CupertinoTheme getTimerPicker() {
    TimerModel _timerModel = Provider.of<TimerModel>(context, listen: false);
    return CupertinoTheme(
      data: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
            pickerTextStyle: TextStyle(color: Colors.white)),
      ),
      child: CupertinoTimerPicker(onTimerDurationChanged: (duration) {
        _timerModel.setRemainingTime(duration);
        if (!_isPaused) {
          destruct();
          _isPaused = true;
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kMainBackground,
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
              String countdown = data.getRemainingTime()?.toString() ?? '';
              return Center(
                child: Column(
                  children: [
                    Text(
                      countdown,
                      style: kTimerTextStyle,
                    ),
                    countdown != 'Done!'
                        ? Text(
                            'UNTIL NEXT STEP',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        : SizedBox(),
                  ],
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
                      initialize();
                    } else {
                      destruct();
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
                      destruct();
                    } else {
                      showTimerPicker = false;
                    }
                  });
                },
              ),
            ],
          ),
          showTimerPicker
              ? Container(
                  decoration: BoxDecoration(
                    color: kMainBackground,
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
