import 'package:flutter/material.dart';
import 'package:sourdough_baker/screens/calculator_screen.dart';
import '../widgets/button.dart';
import '../utils/constants.dart';
import 'nine_to_five_screen.dart';
import 'one_day_baker_screen.dart';
import './night_baker_screen.dart';

class ChooseSchedule extends StatelessWidget {
  static const String id = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackground,
      appBar: AppBar(
        title: Text('Choose your schedule'),
        backgroundColor: kDarkShade,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MainButton(
              title: 'The One Day Bake',
              inputColour: kMainBrand,
              onPressed: () {
                Navigator.pushNamed(context, OneDayBakerScreen.id);
              },
            ),
            MainButton(
              title: 'The 9-5 Bake',
              inputColour: kMainBrand,
              onPressed: () {
                Navigator.pushNamed(context, NineToFiveScreen.id);
              },
            ),
            MainButton(
              title: 'The Night Baker',
              inputColour: kMainBrand,
              onPressed: () {
                Navigator.pushNamed(context, NightBakerScreen.id);
              },
            ),
            MainButton(
              title: 'Calculator',
              inputColour: kMainBrand,
              onPressed: () {
                Navigator.pushNamed(context, CalculatorScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
