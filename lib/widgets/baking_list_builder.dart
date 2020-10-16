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
  bool _isPaused = false;
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
                      recipeItem.toggleDone();
                      if (recipeItem.isDone == true) {
                        showTimer = true;
                        timer.setRemainingTime(recipeItem.milisecondsUntilNext);
                      } else {
                        showTimer = false;
                      }
                    });
                  });
            },
            itemCount: widget.recipeList.length,
          ),
        ),
        showTimer
            ? Column(
                children: <Widget>[
                  Center(
                    child: CountdownTimer(initialTime: timerUntilNext),
                  ),
                  Row(
                    children: <Widget>[
                      FloatingActionButton.extended(
                          onPressed: () {
                            setState(() {
                              if (_isPaused) {
                                _isPaused = false;
                              } else {
                                _isPaused = true;
                              }
                            });
                          },
                          icon:
                              Icon(_isPaused ? Icons.play_arrow : Icons.pause),
                          label: Text(_isPaused ? "Resume" : "Pause")),
                    ],
                  )
                ],
              )
            : SizedBox(),
      ],
    );
  }
}
