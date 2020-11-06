import './recipe_item_model.dart';
import 'package:flutter/foundation.dart';
import '../data/recipes.dart';

class RecipeModel extends ChangeNotifier {
  static Recipes recipeData = Recipes();
  Map<String, List<RecipeItemModel>> recipes = {
    'The Night Bake': recipeData.getRecipe('The Speedbake'),
    'The Speedbake': recipeData.getRecipe('The Night Bake'),
    'The 9-5 Bake': recipeData.getRecipe('The 9-5 Bake'),
  };

  void setRecipe(recipeName, recipeList) {
    recipes[recipeName] = recipeList;
  }

  int getLength(recipeName) => recipes[recipeName].length;

  List<RecipeItemModel> getRecipe(recipeName) => recipes[recipeName];
}
