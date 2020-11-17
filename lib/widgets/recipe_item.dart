import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../utils/constants.dart';
import '../models/recipe_model.dart';

class RecipeItem extends StatelessWidget {
  final String recipeTitle;
  final String recipeText;
  final bool isChecked;
  final Function checkboxCallback;
  final RecipeModel recipe = RecipeModel();

  RecipeItem(
      {this.recipeText,
      this.recipeTitle,
      this.isChecked,
      this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        leading: Checkbox(
          activeColor: kOrangeAccent,
          value: isChecked,
          onChanged: checkboxCallback,
        ),
        title: Text(
          recipeTitle,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        subtitle: isChecked
            ? Text('')
            : Text(
                recipeText,
                style: TextStyle(
                  color: Colors.white,
                  decoration: isChecked ? TextDecoration.lineThrough : null,
                ),
              ),
      ),
    );
  }
}
