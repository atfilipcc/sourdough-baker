import './recipe_model.dart';

RecipeModel recipes = RecipeModel();

class RecipeItemModel {
  final String title;
  final String text;
  final String key;
  bool isDone = false;
  Duration durationUntilNext;

  RecipeItemModel(
      {this.text,
      this.title,
      this.isDone = false,
      this.durationUntilNext,
      this.key}) {
    // isDone = recipes.loadAlt(this.title);
  }

  void toggleDone() {
    isDone = !isDone;
    recipes.save(this);
  }
}
