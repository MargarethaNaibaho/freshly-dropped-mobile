import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freshy_food/modoels/recipe_overview_model.dart';
import 'package:freshy_food/services/api_service.dart';

class FavoriteService{
  final ApiService _apiService = ApiService();
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<bool> isFavorite(String recipeId) async{
    try{
      String? userCredetialId = await _storage.read(key: 'user_id');
      if(userCredetialId == null){
        throw Exception("User ID not found");
      }

      String endpoint = 'favorite/$userCredetialId/$recipeId';

      final response = await _apiService.get(endpoint);
      return response['statusCode'] == 200;
    } catch(e){
      rethrow;
    }
  }

  Future<void> toggleFavorite(String recipeId) async{
    try{
      String? userCredetialId = await _storage.read(key: 'user_id');
      if(userCredetialId == null){
        throw Exception("User ID not found");
      }

      bool alreadyFavorite = await isFavorite(recipeId);

      if(alreadyFavorite){
        String endpoint = 'favorite/$userCredetialId/$recipeId';
        await _apiService.delete(endpoint, {});
      } else{
        String endpoint = 'favorite/$userCredetialId/$recipeId';
        await _apiService.post(endpoint, {});
      }
    } catch(e){
      throw Exception("Error in toggle Favorite: $e");
    }
  }

  Future<List<RecipeOverviewModel>> getAllFavorites() async{
    try{
      String? userCredentialId = await _storage.read(key: 'user_id');
      if(userCredentialId == null){
        throw Exception("User ID not found");
      }

      String endpoint = 'favorite/$userCredentialId';

      final response = await _apiService.get(endpoint);
      log("ini dari favorites screen service $response");
      
      if(response['statusCode'] == 200){
        var listRecipesFromJson = response['data']['listRecipes'] as List;
        log("ini dari favorites screen service bagian status code $listRecipesFromJson");
        return listRecipesFromJson.map((item) => RecipeOverviewModel.fromJson(item)).toList();
      } else{
        throw Exception("Failed to fetch favorites");
      }
    }
    catch(e){
      rethrow;
    }
  }
}