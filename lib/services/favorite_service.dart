import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
      throw("Error in toggle Favorite: $e");
    }
  }
}