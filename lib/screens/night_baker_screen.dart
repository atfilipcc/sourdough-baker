import 'package:flutter/material.dart';
import '../models/recipe_item_model.dart';
import '../widgets/baking_screen_builder.dart';

class NightBakerScreen extends StatefulWidget {
  static final id = 'night_baker_screen';
  @override
  _NightBakerScreenState createState() => _NightBakerScreenState();
}

class _NightBakerScreenState extends State<NightBakerScreen> {
  List<RecipeItemModel> recipeItems = [
    RecipeItemModel(
      title: 'Feed Starter - 3:00 pm',
      text:
          'Discard most of your starter until you are left with around 20 grams, then refeed your starter with flour and cold water',
      isDone: false,
      durationUntilNext: Duration(
        hours: 4,
        minutes: 0,
        seconds: 0,
      ),
    ),
    RecipeItemModel(
        title: 'Autolyse - 7:00 pm',
        text:
            'Mix the flour and water together without kneading until the entire dough is wet.',
        isDone: false,
        durationUntilNext: Duration(
          hours: 1,
          minutes: 0,
          seconds: 0,
        )),
    RecipeItemModel(
        title: 'Salt & Starter - 8:00 pm',
        text:
            'The starter should now be fully activated. Mix the starter with the dough and salt and cover.',
        isDone: false,
        durationUntilNext: Duration(
          hours: 0,
          minutes: 30,
          seconds: 0,
        )),
    RecipeItemModel(
        title: 'Stretch & Fold - 8:30 pm',
        text:
            'Stretch and fold every 45 minutes for the next two to three hours. The dough should be smooth and pass the window pane test.',
        isDone: false,
        durationUntilNext: Duration(
          hours: 2,
          minutes: 0,
          seconds: 0,
        )),
    RecipeItemModel(
        title: 'Bulk Rise - 10:30 pm',
        text: 'The dough should now rest until it has risen by 50%.',
        isDone: false,
        durationUntilNext: Duration(
          hours: 2,
          minutes: 0,
          seconds: 0,
        )),
    RecipeItemModel(
        title: 'Pre-Shape and Bench Rest - 12:30 am',
        text:
            'Once the bulk rise is finished, preshape your loaves carefully before allowing them to rest for around thirty minutes. ',
        isDone: false,
        durationUntilNext: Duration(
          hours: 0,
          minutes: 30,
          seconds: 0,
        )),
    RecipeItemModel(
        title: 'Final Shape and Proof - 01:00 am',
        text:
            'Shape the loaves and place them either in your proofing basket or baking tray. Put your loaves inside an airtight plastic- or ziplock bag and place them in the fridge to proof overnight.',
        isDone: false,
        durationUntilNext: Duration(
          hours: 0,
          minutes: 30,
          seconds: 0,
        )),
    RecipeItemModel(
        title: 'Preheat Oven - 1:00 pm',
        text:
            'Preheat your oven for 45-60 minutes at 240°/500F. If you are baking the loaf inside a dutch oven, place it inside to heat up as well.',
        isDone: false,
        durationUntilNext: Duration(
          hours: 12,
          minutes: 0,
          seconds: 0,
        )),
    RecipeItemModel(
        title: 'Baking - 2:00 pm',
        text:
            'Remove proofed loaves onto parchment paper or directly into the preheated dutch oven, score loaves then bake for 20 minutes with the lid on. Turn the oven down to 450, remove the lid on the dutch oven and continue bake for 20-30 minutes with lid off. Let the loaves cool completely before cutting.',
        isDone: false,
        durationUntilNext: Duration(
          hours: 1,
          minutes: 0,
          seconds: 0,
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return BakingScreenBuilder(
        recipeName: 'The Night Baker', recipeItems: recipeItems);
  }
}
