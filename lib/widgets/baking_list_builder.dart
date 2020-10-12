import 'package:flutter/material.dart';
import 'recipe_item.dart';
import '../models/recipe_item_model.dart';
// import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import './countdown_timer_model.dart';

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
  CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
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
                        timerUntilNext = recipeItem.milisecondsUntilNext;
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
                    child: CircularCountDownTimer(
                      duration: (timerUntilNext ~/ 1000).toInt(),
                      controller: _controller,
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 3,
                      color: Colors.white,
                      fillColor: Colors.red,
                      backgroundColor: null,
                      strokeWidth: 10.0,
                      textStyle: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      isReverse: true,
                      isTimerTextShown: true,
                      onComplete: () {
                        print('Countdown Ended');
                      },
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      FloatingActionButton.extended(
                          onPressed: () {
                            setState(() {
                              if (_isPaused) {
                                _isPaused = false;
                                _controller.resume();
                              } else {
                                _isPaused = true;
                                _controller.pause();
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
