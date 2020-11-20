import 'package:flutter/material.dart';
import 'recipe_item.dart';
import '../models/recipe_item_model.dart';
import 'countdown_timer.dart';
import '../models/countdown_timer_model.dart';
import '../models/time_model.dart';
import '../models/notification_model.dart';
import '../models/recipe_model.dart';
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
    RecipeModel recipe = Provider.of<RecipeModel>(context, listen: true);
    NotificationModel notification =
        Provider.of<NotificationModel>(context, listen: false);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, i) {
              CountdownTimerModel timer =
                  Provider.of<CountdownTimerModel>(context, listen: false);
              TimeModel time = Provider.of<TimeModel>(context, listen: false);
              List<RecipeItemModel> recipeItem =
                  recipe.getRecipe(widget.recipeNameToGet);
              return RecipeItem(
                  recipeTitle: recipeItem[i].title,
                  recipeText: recipeItem[i].text,
                  isChecked: recipeItem[i].isDone ?? false,
                  checkboxCallback: (checkboxState) {
                    setState(() {
                      for (var j = 0; j < i; j++) {
                        if (!recipeItem[j].isDone) {
                          recipeItem[j].toggleDone();
                        }
                      }
                      recipeItem[i].toggleDone();
                      if (recipeItem[i].isDone) {
                        showTimer = recipeItem[i].isDone;
                        if (recipeItem[i].durationUntilNext.inMicroseconds !=
                            0) {
                          timer.setRemainingTime(
                              recipeItem[i].durationUntilNext);
                          time.saveTimeData(recipeItem[i].durationUntilNext);
                          notification.scheduleNotification(
                              recipeItem[i].durationUntilNext);
                        }
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
