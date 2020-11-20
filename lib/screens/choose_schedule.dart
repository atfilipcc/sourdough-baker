import 'package:flutter/material.dart';
import 'package:sourdough_baker/screens/calculator_screen.dart';
import '../widgets/main_button.dart';
import '../utils/constants.dart';
import 'nine_to_five_screen.dart';
import 'speedbake_screen.dart';
import './night_baker_screen.dart';
import '../models/recipe_model.dart';
import '../models/notification_model.dart';
import '../models/countdown_timer_model.dart';
import '../models/time_model.dart';
import 'package:provider/provider.dart';

class ChooseSchedule extends StatelessWidget {
  static const String id = '/';

  void loadCheckState(String recipeName, BuildContext context) async {
    try {
      Provider.of<RecipeModel>(context, listen: false)
          .loadRecipeData(recipeName);
    } catch (e) {
      print(e);
    }
  }

  void loadTimerState(BuildContext context) async {
    print('running load timer');
    try {
      TimeModel time = Provider.of<TimeModel>(context, listen: false);
      await time.loadTimeData();
      NotificationModel notification =
          Provider.of<NotificationModel>(context, listen: false);
      CountdownTimerModel timer =
          Provider.of<CountdownTimerModel>(context, listen: false);

      Duration duration = time.scheduledDurationDate;
      if (duration.isNegative == false) {
        notification.scheduleNotification(duration);
        timer.setRemainingTime(duration);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    loadCheckState('The Speedbake', context);
    loadCheckState('The 9-5 Bake', context);
    loadCheckState('The Night Bake', context);
    loadTimerState(context);
    return Scaffold(
      backgroundColor: kMainBackground,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: [
              Text(
                'Schedules',
                style: kHeadline,
              ),
              MainButton(
                title: 'The Speedbake',
                inputColour: kOrangeAccent,
                onPressed: () {
                  Navigator.pushNamed(context, SpeedbakeScreen.id);
                },
              ),
              MainButton(
                title: 'The 9-5 Bake',
                inputColour: kOrangeAccent,
                onPressed: () {
                  Navigator.pushNamed(context, NineToFiveScreen.id);
                },
              ),
              MainButton(
                title: 'The Night Bake',
                inputColour: kOrangeAccent,
                onPressed: () {
                  Navigator.pushNamed(context, NightBakerScreen.id);
                },
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Tools',
                style: kHeadline,
              ),
              MainButton(
                title: 'Calculator',
                inputColour: kOrangeAccent,
                onPressed: () {
                  Navigator.pushNamed(context, CalculatorScreen.id);
                },
              ),
            ],
          ),
        ],
      )),
    );
  }
}
