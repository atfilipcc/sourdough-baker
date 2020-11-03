import 'package:flutter/material.dart';
import 'recipe_item.dart';
import '../models/recipe_item_model.dart';
import 'countdown_timer.dart';
import '../models/timer_model.dart';
import 'package:provider/provider.dart';

class BakingListBuilder extends StatefulWidget {
  final List<RecipeItemModel> recipeList;

  BakingListBuilder(this.recipeList);

  @override
  _BakingListBuilderState createState() => _BakingListBuilderState();
}

class _BakingListBuilderState extends State<BakingListBuilder> {
  bool showTimer = false;
  int timerUntilNext = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              TimerModel timer =
                  Provider.of<TimerModel>(context, listen: false);
              final recipeItem = widget.recipeList[index];
              return RecipeItem(
                  recipeTitle: recipeItem.title,
                  recipeText: recipeItem.text,
                  isChecked: recipeItem.isDone,
                  checkboxCallback: (checkboxState) {
                    setState(() {
                      for (var i = 0; i < index; i++) {
                        if (!widget.recipeList[i].isDone) {
                          widget.recipeList[i].toggleDone();
                        }
                      }
                      recipeItem.toggleDone();
                      if (recipeItem.isDone) {
                        timer.setRemainingTime(recipeItem.durationUntilNext);
                        showTimer = true;
                      } else {
                        showTimer = false;
                      }
                    });
                  });
            },
            itemCount: widget.recipeList.length,
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
