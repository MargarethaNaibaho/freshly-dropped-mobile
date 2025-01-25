class RecipeOverviewModel {
  final String favoriteId;
  final String recipeId;
  final String recipeName;
  final String description;
  final int calorie;
  final int countUserStar;
  final List<Nutrition> listNutritions;
  final ThumbnailImage thumbnailImage;

  RecipeOverviewModel({
    this.favoriteId = '',
    required this.recipeId,
    required this.recipeName,
    required this.description,
    required this.calorie,
    required this.countUserStar,
    required this.listNutritions,
    required this.thumbnailImage,
  });

  factory RecipeOverviewModel.fromJson(Map<String, dynamic> json){
    var listNutritionsFromJson = json['listNutritions'] as List? ?? [];
    List<Nutrition> listNutritions = listNutritionsFromJson
      .map((nutrition) => Nutrition.fromJson(nutrition))
      .toList();

    return RecipeOverviewModel(
      favoriteId: json['favoriteId'] ?? '',
      recipeId: json['recipeId'], 
      recipeName: json['recipeName'], 
      description: json['description'], 
      calorie: json['calorie'], 
      countUserStar: json['countUserStar'], 
      listNutritions: listNutritions, 
      thumbnailImage: ThumbnailImage.fromJson(json['thumbnailImage']),
    );
  }
}

class Nutrition{
  final String id;
  final String nutritionName;

  Nutrition({required this.id, required this.nutritionName});

  factory Nutrition.fromJson(Map<String, dynamic> json){
    return Nutrition(
      id: json['id'], 
      nutritionName: json['nutritionName'],
    );
  }

  @override
  String toString(){
    return nutritionName;
  }
}

class ThumbnailImage{
  final String filename;
  final String url;

  ThumbnailImage({required this.filename, required this.url});

  factory ThumbnailImage.fromJson(Map<String, dynamic> json){
    return ThumbnailImage(
      filename: json['filename'], 
      url: json['url']
    );
  }
}