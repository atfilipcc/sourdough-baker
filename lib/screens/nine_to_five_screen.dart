import 'package:flutter/material.dart';
import '../models/recipe_item_model.dart';
import '../widgets/baking_screen_builder.dart';

class NineToFiveScreen extends StatefulWidget {
  static final id = 'nine_to_five_baker_screen';
  @override
  _NineToFiveScreenState createState() => _NineToFiveScreenState();
}

class _NineToFiveScreenState extends State<NineToFiveScreen> {
  List<RecipeItemModel> recipeItems = [
    RecipeItemModel(
      title: 'Feed Starter - 8 am',
      text:
          'Remove most of the starter leaving at least 2 Tbsp, then feed your starter with flour and ice cold water to slow down the activation process. Autolyse - mix the flour and water without kneading.',
      isDone: false,
      milisecondsUntilNext: (3600000 * 9),
    ),
    RecipeItemModel(
      title: 'Salt & Starter - 5:00 pm',
      text:
          'Once the starter is fully activated, incorporate the starter and salt into the dough with the stretch and fold technique',
      isDone: false,
      milisecondsUntilNext: (3600000 * 0.5).toInt(),
    ),
    RecipeItemModel(
      title: 'Stretch & Fold - 5:30 pm',
      text:
          'Perform a stretch and fold round every 30 minutes for the next 2-2.5 hours until you feel the dough has developed a nice gluten structure.',
      isDone: false,
      milisecondsUntilNext: (3600000 * 2),
    ),
    RecipeItemModel(
      title: 'Bulk Rise - 7:30 pm',
      text:
          'Let the dough sit for the next few hours until it has risen by 30-50% this process depends on the variables* listed above so use your intuition!',
      isDone: false,
      milisecondsUntilNext: (3600000 * 2.5).toInt(),
    ),
    RecipeItemModel(
      title: 'Pre-Shape and Bench Rest - 10:00 pm',
      text:
          'Once you are satisfied with your bulk rise, remove the dough onto a floured surface and pre shape your loaves. Let the reshaped loaves bench rest for 30 minutes.',
      isDone: false,
      milisecondsUntilNext: (3600000 * 2.5).toInt(),
    ),
    RecipeItemModel(
      title: 'Final Shape and Proof - 10:30 pm',
      text:
          ' Give your loaves a final shaping and place them in the baskets. Place your proofing baskets in a plastic bag (or plastic wrap) and let put them the fridge to proof overnight.',
      isDone: false,
      milisecondsUntilNext: (3600000 * 8.5).toInt(),
    ),
    RecipeItemModel(
      title: 'Preheat Oven - 7:00 am',
      text:
          'Place your dutch oven pan in the oven at 500 Degrees Fahrenheit and preheat for at least 45 minutes.',
      isDone: false,
      milisecondsUntilNext: (3600000 * 1),
    ),
    RecipeItemModel(
      title: 'Baking - 8:00 am',
      text:
          'Remove proofed loaves onto parchment paper or directly into the preheated dutch oven, score loaves then bake for 20 minutes with the lid on. Turn the oven down to 450, remove the lid on the dutch oven and continue bake for 20-30 minutes with lid off. Let the loaves cool completely before cutting.',
      isDone: false,
      milisecondsUntilNext: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BakingScreenBuilder(
        recipeName: 'The 9-5 Bake', recipeItems: recipeItems);
  }
}
