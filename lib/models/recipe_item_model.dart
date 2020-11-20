import './recipe_model.dart';

RecipeModel recipes = RecipeModel();

class RecipeItemModel {
  final String title;
  final String text;
  final String key;
  bool isDone;
  Duration durationUntilNext;

  RecipeItemModel(
      {this.text, this.title, this.isDone, this.durationUntilNext, this.key});

  void toggleDone() {
    isDone = !isDone;
    recipes.saveRecipeData(this);
  }
}
