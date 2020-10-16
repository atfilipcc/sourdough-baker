class Calculator {
  Calculator({this.flour, this.hydration});

  final int flour;
  final int hydration;

  String _salt;
  String _starter;
  String _water;

  void _calculateIngredients() {
    _starter = (flour * 0.20).toStringAsFixed(0);
    _salt = (flour * 0.02).toStringAsFixed(0);
    _water = (flour * hydration / 100).toStringAsFixed(0);
  }

  String getResult() {
    _calculateIngredients();
    return 'For $flour grams of flour and a hydration of $hydration%, use $_water grams of water, $_salt grams of salt and $_starter grams of starter. ';
  }
}
