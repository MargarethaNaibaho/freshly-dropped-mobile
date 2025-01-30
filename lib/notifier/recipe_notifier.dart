import 'dart:developer';

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
  String? _errorMessage;

  late Future<RecipeDetailModel> recipeDetail;
  bool isFavorite = false;
  int counter = 1;

  List<RecipeOverviewModel> get listRecipes => _listRecipes;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void initialize(String recipeId){
    _errorMessage = null;
     notifyListeners();
     log("di sini salah $errorMessage");
    recipeDetail = _recipeService.getRecipeById(recipeId);
    _checkFavoriteStatus(recipeId);
  }

  Future<void> _checkFavoriteStatus(String recipeId) async{
    _errorMessage = null;
     notifyListeners();
     log("di sini salah $errorMessage");
    try{
      log("di sini salah dalam try $errorMessage");
      isFavorite = await _favoriteService.isFavorite(recipeId);
    } catch(e){
      _errorMessage = "Gagal mengambil data. Periksa koneksi internet Anda";
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> toggleFavorite(String recipeId) async{
    _errorMessage = null;
    try{
      await _favoriteService.toggleFavorite(recipeId);
      isFavorite = !isFavorite;
      notifyListeners();
    } catch(e){
      _errorMessage = "Gagal menghubungkan. Periksa koneksi internet Anda";
      notifyListeners();
    }
  }

  Future<void> loadAllRecipes() async{
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try{
      _listRecipes = await _recipeService.getRecipes();
    } catch(e){
      _errorMessage = 'Gagal mendapatkan resep. Pastikan koneksi internet Anda';
      notifyListeners();
    }

    _isLoading = false;
    notifyListeners();
  }

  void incrementCounter(){
    _errorMessage = null;
    counter++;
    notifyListeners();
  }

  void decrementCounter(){
    _errorMessage = null;
    if(counter > 1){
      counter--;
      notifyListeners();
    }
  }
}