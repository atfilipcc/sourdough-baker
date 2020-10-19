import 'package:flutter/material.dart';
import '../models/recipe_item_model.dart';
import '../utils/constants.dart';
import './baking_list_builder.dart';

class BakingScreenBuilder extends StatelessWidget {
  const BakingScreenBuilder({
    Key key,
    @required this.recipeItems,
    @required this.recipeName,
  }) : super(key: key);

  final List<RecipeItemModel> recipeItems;
  final String recipeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBrand,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding:
                EdgeInsets.only(top: 20.0, left: 0, right: 30.0, bottom: 10.0),
            child: Row(
              children: [
                BackButton(color: Colors.white),
                Center(
                  child: Text(
                    recipeName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: BakingListBuilder(recipeItems),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
