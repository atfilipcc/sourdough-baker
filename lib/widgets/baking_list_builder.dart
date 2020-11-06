import 'package:flutter/material.dart';
import 'recipe_item.dart';
import '../models/recipe_model.dart';
import '../models/recipe_item_model.dart';
import 'countdown_timer.dart';
import '../models/timer_model.dart';
import 'package:provider/provider.dart';

class BakingListBuilder extends StatefulWidget {
  final String recipeNameToGet;

  BakingListBuilder(this.recipeNameToGet);

  @override
  _BakingListBuilderState createState() => _BakingListBuilderState();
}

class _BakingListBuilderState extends State<BakingListBuilder> {
  bool showTimer = false;
  int timerUntilNext = 0;

  @override
  Widget build(BuildContext context) {
    RecipeModel recipe = Provider.of<RecipeModel>(context, listen: false);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, i) {
              TimerModel timer =
                  Provider.of<TimerModel>(context, listen: false);
              List<RecipeItemModel> recipeItem =
                  recipe.getRecipe(widget.recipeNameToGet);
              return RecipeItem(
                  recipeTitle: recipeItem[i].title,
                  recipeText: recipeItem[i].text,
                  isChecked: recipeItem[i].isDone,
                  checkboxCallback: (checkboxState) {
                    setState(() {
                      for (var j = 0; j < i; j++) {
                        if (!recipeItem[j].isDone) {
                          recipeItem[j].toggleDone();
                        }
                      }
                      recipeItem[i].toggleDone();
                      if (recipeItem[i].isDone) {
                        timer.setRemainingTime(recipeItem[i].durationUntilNext);
                        showTimer = true;
                      } else {
                        showTimer = false;
                      }
                    });
                  });
            },
            itemCount: recipe.getLength(widget.recipeNameToGet),
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              child: CountdownTimer(),
            ),
          ],
        )
      ],
    );
  }
}
