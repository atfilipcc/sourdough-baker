import 'package:flutter/material.dart';
import 'dart:async';
import '../models/timer_model.dart';
import 'package:provider/provider.dart';

class CountdownTimer extends StatefulWidget {
  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  Timer _timer;

  @override
  void initState() {
    TimerModel _timer = Provider.of<TimerModel>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (t) {
      _timer.updateRemainingTime();
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
          )
        ],
      ),
    );
  }
}
