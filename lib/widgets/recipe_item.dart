import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../utils/constants.dart';

class RecipeItem extends StatelessWidget {
  final String recipeTitle;
  final String recipeText;
  final bool isChecked;
  final Function checkboxCallback;

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
          activeColor: kMainBrand,
          value: isChecked,
          onChanged: checkboxCallback,
        ),
        title: Text(recipeTitle, style: TextStyle(fontWeight: FontWeight.w500)),
        subtitle: isChecked
            ? Text('')
            : Text(
                recipeText,
                style: TextStyle(
                  decoration: isChecked ? TextDecoration.lineThrough : null,
                ),
              ),
      ),
    );
  }
}
