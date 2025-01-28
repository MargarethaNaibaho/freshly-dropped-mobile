import 'package:flutter/foundation.dart';
import 'package:freshy_food/modoels/recipe_detail_model.dart';
import 'package:freshy_food/services/favorite_service.dart';
import 'package:freshy_food/services/recipe_service.dart';

class RecipeNotifier extends ChangeNotifier{
  final FavoriteService _favoriteService = FavoriteService();
  final RecipeService _recipeService = RecipeService();

  late Future<RecipeDetailModel> recipeDetail;
  bool isFavorite = false;
  int counter = 1;

  void initialize(String recipeId){
    recipeDetail = _recipeService.getRecipeById(recipeId);
    _checkFavoriteStatus(recipeId);
  }

  Future<void> _checkFavoriteStatus(String recipeId) async{
    isFavorite = await _favoriteService.isFavorite(recipeId);
    notifyListeners();
  }

  Future<void> toggleFavorite(String recipeId) async{
    try{
      await _favoriteService.toggleFavorite(recipeId);
      isFavorite = !isFavorite;
      notifyListeners();
    } catch(e){
      throw Exception("Unable to toggle favorite status");
    }
  }

  void incrementCounter(){
    counter++;
    notifyListeners();
  }

  void decrementCounter(){
    if(counter > 1){
      counter--;
      notifyListeners();
    }
  }
}