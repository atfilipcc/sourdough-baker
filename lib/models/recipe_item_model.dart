class RecipeItemModel {
  final String title;
  final String text;
  bool isDone;
  Duration durationUntilNext;

  RecipeItemModel(
      {this.text, this.title, this.isDone = false, this.durationUntilNext});

  void toggleDone() {
    isDone = !isDone;
  }
}
