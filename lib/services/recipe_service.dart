import 'package:freshy_food/modoels/recipe_overview_model.dart';
import 'package:freshy_food/services/api_service.dart';

class RecipeService {
  final ApiService _apiService = ApiService();

  Future<List<RecipeOverviewModel>> getRecipes() async{
    try{
      final response = await _apiService.get('recipe');

      if(response['statusCode'] == 200){
        var data = response['data'] as List;
        return data.map((item) => RecipeOverviewModel.fromJson(item)).toList();
      } else{
        throw Exception("Failed to load recipe");
      }
    } catch(e){
        rethrow;
    }
  }
}