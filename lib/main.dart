import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/nine_to_five_screen.dart';
import './screens/one_day_baker_screen.dart';
import './screens/choose_schedule.dart';
import './screens/night_baker_screen.dart';
import './screens/calculator_screen.dart';
import './models/timer_model.dart';

void main() {
  runApp(SourdoughBaker());
}

class SourdoughBaker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TimerModel(),
      child: MaterialApp(
        title: 'Sourdough Baker',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          ChooseSchedule.id: (context) => ChooseSchedule(),
          CalculatorScreen.id: (context) => CalculatorScreen(),
          OneDayBakerScreen.id: (context) => OneDayBakerScreen(),
          NineToFiveScreen.id: (context) => NineToFiveScreen(),
          NightBakerScreen.id: (context) => NightBakerScreen(),
        },
      ),
    );
  }
}
