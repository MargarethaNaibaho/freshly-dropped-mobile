import 'package:flutter/foundation.dart';
import 'package:freshy_food/modoels/recipe_overview_model.dart';
import 'package:freshy_food/services/favorite_service.dart';

class FavoriteNotifier extends ChangeNotifier{
  final FavoriteService _favoriteService = FavoriteService();
  List<RecipeOverviewModel> _favoriteRecipes = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<RecipeOverviewModel> get favoriteRecipes => _favoriteRecipes;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadFavoriteRecipes() async{
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try{
      _favoriteRecipes = await _favoriteService.getAllFavorites();
    } catch(e){
      _errorMessage = 'Gagal mengambil data. Periksa koneksi internet Anda.';
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> toggleFavorite(String recipeId) async{
    _errorMessage = null;
    try{
      await _favoriteService.toggleFavorite(recipeId);
      _favoriteRecipes.removeWhere((recipe) => recipe.recipeId == recipeId);
      notifyListeners();
    } catch(e){
      _errorMessage = 'Gagal mengambil data. Periksa koneksi internet Anda.';
      notifyListeners();
    }
  }
}