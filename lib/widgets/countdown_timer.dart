import 'package:flutter/material.dart';
import 'dart:async';
import '../models/timer_model.dart';
import 'package:provider/provider.dart';

class CountdownTimer extends StatefulWidget {
  final initialTime;
  CountdownTimer({this.initialTime});

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (t) {
      TimerModel timer = Provider.of<TimerModel>(context, listen: false);
      timer.updateRemainingTime();
    });
    super.initState();
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
                style: TextStyle(fontSize: 72, color: Colors.black),
              );
            },
          )
        ],
      ),
    );
  }
}
