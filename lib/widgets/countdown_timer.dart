import 'package:flutter/material.dart';
import '../models/countdown_timer_model.dart';
import '../models/notification_model.dart';
import 'package:provider/provider.dart';
import '../utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'timer_picker.dart';

class CountdownTimer extends StatefulWidget {
  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Offset> _offsetAnimation;

  bool _isPaused = false;
  bool showTimerPicker = false;
  bool showPauseButton = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 600,
      ),
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));
    initialize();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void initialize() {
    _isPaused = false;
    CountdownTimerModel _timerModel =
        Provider.of<CountdownTimerModel>(context, listen: false);
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
    CountdownTimerModel _timerModel =
        Provider.of<CountdownTimerModel>(context, listen: false);
    NotificationModel _notificationModel =
        Provider.of<NotificationModel>(context, listen: false);
    _timerModel.pauseTimer();
    _notificationModel.cancelNotification();
  }

  Function timerPickerCallback() {
    CountdownTimerModel _timerModel =
        Provider.of<CountdownTimerModel>(context, listen: false);
    return (duration) {
      _timerModel.setRemainingTime(duration);
      if (!_isPaused) {
        destruct();
        _isPaused = true;
      }
    };
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
          Consumer<CountdownTimerModel>(
            builder: (context, data, child) {
              String countdown = data.getRemainingTime()?.toString() ?? '';
              return countdown != '::'
                  ? Center(
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
                    )
                  : SizedBox();
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
                      _animationController.forward();
                      destruct();
                    } else {
                      showTimerPicker = false;
                      _animationController.reverse();
                    }
                  });
                },
              ),
            ],
          ),
          showTimerPicker
              ? Container(
                  decoration: BoxDecoration(
                    color: kDarkShade,
                    borderRadius: kBorderRadiusRoundedTop,
                  ),
                  child: TimerPicker(
                    callback: timerPickerCallback,
                  ),
                )
              : SizedBox(height: 0)
        ],
      ),
    );
  }
}
