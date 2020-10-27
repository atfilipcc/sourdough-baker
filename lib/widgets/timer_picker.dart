import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TimerPicker extends StatelessWidget {
  const TimerPicker({@required this.callback});
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
            pickerTextStyle: TextStyle(color: Colors.white)),
      ),
      child: CupertinoTimerPicker(
        onTimerDurationChanged: callback(),
      ),
    );
  }
}
