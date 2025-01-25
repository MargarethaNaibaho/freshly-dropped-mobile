import 'dart:developer';

import 'package:freshy_food/modoels/recipe_overview_model.dart';

class RecipeDetailModel {
  final String recipeId;
  final String recipeName;
  final String description;
  final int calorie;
  final int countUserStar;
  final List<Nutrition> listNutritions;
  final List<RecipeType> listRecipeTypes;
  final List<Country> listCountries;
  final List<Ingredient> listIngredients;
  final ThumbnailImage thumbnailImage;
  final DetailImage detailImage;

  RecipeDetailModel({
    required this.recipeId,
    required this.recipeName,
    required this.description,
    required this.calorie,
    required this.countUserStar,
    required this.listNutritions,
    required this.listRecipeTypes,
    required this.listCountries,
    required this.listIngredients,
    required this.thumbnailImage,
    required this.detailImage,
  });

  factory RecipeDetailModel.fromJson(Map<String, dynamic> json) {
    var listNutritionsFromJson = json['recipe']['listNutritions'] as List;
    var listRecipeTypesFromJson = json['recipe']['listRecipeTypes'] as List;
    var listCountriesFromJson = json['recipe']['listCountries'] as List;
    var listIngredientsFromJson = json['recipe']['listIngredients'] as List;
    

    List<Nutrition> listNutritions = listNutritionsFromJson
      .map((nutrition) => Nutrition.fromJson(nutrition))
      .toList();

    List<RecipeType> listRecipeTypes = listRecipeTypesFromJson
      .map((recipeType) => RecipeType.fromJson(recipeType))
      .toList();

    List<Country> listCountries = listCountriesFromJson
      .map((country) => Country.fromJson(country))
      .toList();
    log("ini dari recipe_detail_model $listCountries");

    List<Ingredient> listIngredients = listIngredientsFromJson
      .map((ingredient) => Ingredient.fromJson(ingredient))
      .toList();

    return RecipeDetailModel(
      recipeId: json['recipe']['id'], 
      recipeName: json['recipe']['recipeName'], 
      description: json['recipe']['description'], 
      calorie: json['recipe']['calorie'], 
      countUserStar: json['recipe']['countUserStar'], 
      listNutritions: listNutritions, 
      listRecipeTypes: listRecipeTypes, 
      listCountries: listCountries, 
      listIngredients: listIngredients, 
      thumbnailImage: ThumbnailImage.fromJson(json['thumbnailImage']), 
      detailImage: DetailImage.fromJson(json['detailImage'])
    );
  }
}

class RecipeType {
  final String id;
  final String recipeTypeName;

  RecipeType({required this.id, required this.recipeTypeName});

  factory RecipeType.fromJson(Map<String, dynamic> json){
    return RecipeType(
      id: json['id'], 
      recipeTypeName: json['recipeTypeName']
    );
  }

  @override
  String toString() {
    return recipeTypeName;
  }
}

class Country{
  final String id;
  final String countryName;

  Country({required this.id, required this.countryName});

  factory Country.fromJson(Map<String, dynamic> json){
    return Country(
      id: json['id'], 
      countryName: json['countryName']
    );
  }

  @override
  String toString() {
    return countryName;
  }
}

class Ingredient{
  final String id;
  final String ingredientName;

  Ingredient({required this.id, required this.ingredientName});

  factory Ingredient.fromJson(Map<String, dynamic> json){
    return Ingredient(
      id: json['id'], 
      ingredientName: json['ingredientName']
    );
  }

  @override
  String toString() {
    return ingredientName.toString();
  }
}

class DetailImage{
  final String filename;
  final String url;

  DetailImage({required this.filename, required this.url});

  factory DetailImage.fromJson(Map<String, dynamic> json){
    return DetailImage(
      filename: json['filename'], 
      url: json['url']
    );
  }
}