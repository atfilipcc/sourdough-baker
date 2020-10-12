class RecipeItemModel {
  final String title;
  final String text;
  bool isDone;
  int milisecondsUntilNext;

  RecipeItemModel(
      {this.text, this.title, this.isDone = false, this.milisecondsUntilNext});

  void toggleDone() {
    isDone = !isDone;
  }
}
