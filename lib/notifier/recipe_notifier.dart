import 'package:flutter/foundation.dart';
import 'package:freshy_food/modoels/recipe_detail_model.dart';
import 'package:freshy_food/modoels/recipe_overview_model.dart';
import 'package:freshy_food/services/favorite_service.dart';
import 'package:freshy_food/services/recipe_service.dart';

class RecipeNotifier extends ChangeNotifier{
  final FavoriteService _favoriteService = FavoriteService();
  final RecipeService _recipeService = RecipeService();

  List<RecipeOverviewModel> _listRecipes = [];
  bool _isLoading = false;
  String _errorMessage = '';

  late Future<RecipeDetailModel> recipeDetail;
  bool isFavorite = false;
  int counter = 1;

  List<RecipeOverviewModel> get listRecipes => _listRecipes;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

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

  Future<void> loadAllRecipes() async{
    _isLoading = true;
    notifyListeners();
    try{
      _listRecipes = await _recipeService.getRecipes();
      _errorMessage = '';
    } catch(e){
      _errorMessage = 'Failed to load favorites';
    }

    _isLoading = false;
    notifyListeners();
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