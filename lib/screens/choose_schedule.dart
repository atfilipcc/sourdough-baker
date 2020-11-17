import 'package:flutter/material.dart';
import 'package:sourdough_baker/screens/calculator_screen.dart';
import '../widgets/main_button.dart';
import '../utils/constants.dart';
import 'nine_to_five_screen.dart';
import 'speedbake_screen.dart';
import './night_baker_screen.dart';
import '../models/recipe_model.dart';
import 'package:provider/provider.dart';

class ChooseSchedule extends StatelessWidget {
  static const String id = '/';

  void loadState(String recipeName, BuildContext context) async {
    try {
      await Provider.of<RecipeModel>(context, listen: false).load(recipeName);
      print('loaded $recipeName');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    loadState('The Speedbake', context);
    loadState('The 9-5 Bake', context);
    loadState('The Night Bake', context);
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
