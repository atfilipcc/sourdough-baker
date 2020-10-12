import 'package:flutter/material.dart';
import '../widgets/data_card.dart';
import '../utils/constants.dart';
import '../widgets/calculate_button.dart';
import '../utils/calculator_brain.dart';

class CalculatorScreen extends StatefulWidget {
  static final id = 'calculator_screen';
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int selectedHydration = 60;
  int selectedFlourAmount = 500;
  String recipeDescription = '';
  bool showDescription = false;

  void handleHydrationChange(double newHydration) {
    setState(() {
      selectedHydration = newHydration.round();
    });
  }

  void handleFlourChange(double newFlourAmount) {
    setState(() {
      selectedFlourAmount = newFlourAmount.round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: kMainBrand, title: Text('Recipe Calculator')),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DataCard(
                  inputColor: kMainBrand,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'FLOUR',
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: <Widget>[
                          Text(
                            '${selectedFlourAmount.toString()} grams',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Slider(
                        value: selectedFlourAmount.toDouble(),
                        min: 0.0,
                        max: 2000.0,
                        onChanged: (double value) => handleFlourChange(value),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: DataCard(
                  inputColor: kMainBrand,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WATER',
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: <Widget>[
                          Text(
                            '${selectedHydration.toString()}%',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Slider(
                        value: selectedHydration.toDouble(),
                        min: 0.0,
                        max: 100.0,
                        onChanged: (double value) =>
                            handleHydrationChange(value),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            flex: 4,
            child: DataCard(
              inputColor: kMainBrand,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.info, color: Colors.white),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Pick the amount of flour and water you would like to bake with. A higher percentage hydration will result in a larger and more soft bread, but the wet dough will also be harder to work with.',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: DataCard(
              inputColor: kMainBrand,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.work),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        showDescription
                            ? recipeDescription
                            : 'Choose the amount of flour and preferred hydration.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
          ),
          CalculateButton(
              onTap: () {
                CalculatorBrain calculateIngredients = CalculatorBrain(
                    flour: selectedFlourAmount, hydration: selectedHydration);
                setState(() {
                  recipeDescription = calculateIngredients.getResult();
                  showDescription = true;
                });
              },
              buttonTitle: 'Calculate')
        ],
      ),
    );
  }
}
