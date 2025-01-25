import 'dart:developer';

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:freshy_food/modoels/recipe_overview_model.dart';
import 'package:freshy_food/screens/recipes/individual_recipes_screen.dart';
import 'package:freshy_food/services/favorite_service.dart';
import 'package:freshy_food/styles/colors.dart';
import 'package:freshy_food/styles/path/image_path.dart';
import 'package:freshy_food/styles/text_styles.dart';
import 'package:freshy_food/widgets/app_bar_white_with_plus.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late Future<List<RecipeOverviewModel>> _favoriteServiceFuture;

  final FavoriteService _favoriteService = FavoriteService();
  
  @override
  void initState() {
    super.initState();
    _favoriteServiceFuture = _loadFavoriteRecipes();
  }

  Future<List<RecipeOverviewModel>> _loadFavoriteRecipes() async{
    try{
      return await _favoriteService.getAllFavorites();
    }
    catch(e){
      log("Failed to load favorites: iyakah $e");
      return [];
    }
  }

  bool willBeDeleted = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        double widthForOuterCard = constraints.maxWidth - 48;
        bool isTooSmall = constraints.maxWidth < 600;

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBarWhiteWithPlus(linkBack: (context){
            Navigator.pushAndRemoveUntil(
              context, 
              MaterialPageRoute(builder: (context) => BottomAppBar()),
              (Route<dynamic> route) => false,
            );
          }, 
            linkAdd: (){
              log("Ini tombol tambah diklik");
            }, 
            title: "Favorites"
          ),
          body: SafeArea(
            minimum: EdgeInsets.zero,
            child: FutureBuilder<List<RecipeOverviewModel>>(
              future: _favoriteServiceFuture, 
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                } else if(snapshot.hasError){
                  return Center(child: Text("Error: ${snapshot.error}"),);
                } else if(snapshot.data == null || snapshot.data!.isEmpty){
                  return Center(child: Text("No favorites found"),);
                } else{
                  final favoriteRecipes = snapshot.data!;

                  return ListView.builder(
                    itemCount: favoriteRecipes.length,
                    itemBuilder: (context, index){
                      final recipe = favoriteRecipes[index];

                      return Dismissible(
                        key: Key(recipe.recipeId.toString()), 
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          setState(() {
                            favoriteRecipes.removeAt(index);
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: CustomColors.primaryGreen,
                              content: Text(
                                "${recipe.recipeName} dihapus dari favoritmu", 
                                style: TextStyle(
                                  fontSize: 16 * MediaQuery.textScalerOf(context).scale(1), 
                                  color: Colors.white
                                ),
                              ),
                              duration: const Duration(seconds: 4),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        },
                        background: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 28),
                          alignment: Alignment.centerRight,
                          color: CustomColors.dismissRed,
                          child: Image.asset(ImagePath.rubbish, width: 32,),
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(left: 24, bottom: 20, right: 24),
                          width: widthForOuterCard,
                          height: 112,
                          decoration: BoxDecoration(
                            color: CustomColors.cardGrey,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context, 
                                MaterialPageRoute(
                                  builder: (context) => IndividualRecipesScreen(id: recipe.recipeId)
                                )
                              );
                            },
                            child: Row(
                              children: [
                                Flexible(
                                  child: Container(
                                    width: widthForOuterCard - 144,
                                    padding: const EdgeInsets.fromLTRB(16, 10, 0, 13),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(recipe.recipeName, style: TextStyles.titleStyle2(context),),
                                        const SizedBox(height: 8,),
                                        Text("${recipe.description.substring(0, 60)}...", style: TextStyles.descriptionStyle2(context),),
                                        const SizedBox(height: 4,),
                                        Row(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  FluentSystemIcons.ic_fluent_star_filled, 
                                                  color: CustomColors.lightOrange, 
                                                  size: isTooSmall ? 16 : 24,
                                                ),
                                                Icon(
                                                  FluentSystemIcons.ic_fluent_star_filled, 
                                                  color: CustomColors.lightOrange, 
                                                  size: isTooSmall ? 16 : 24,
                                                ),
                                                Icon(
                                                  FluentSystemIcons.ic_fluent_star_filled, 
                                                  color: CustomColors.lightOrange, 
                                                  size: isTooSmall ? 16 : 24,
                                                ),
                                                Icon(
                                                  FluentSystemIcons.ic_fluent_star_filled, 
                                                  color: CustomColors.lightOrange, 
                                                  size: isTooSmall ? 16 : 24,
                                                ),
                                                Icon(
                                                  FluentSystemIcons.ic_fluent_star_half_filled, 
                                                  color: CustomColors.lightOrange, 
                                                  size: isTooSmall ? 16 : 24,
                                                ),
                                              ]
                                            ),
                                            Text("(${recipe.countUserStar})", style: TextStyles.descriptionStyle2(context),),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 25,),
                                Container(
                                  margin: const EdgeInsets.only(right: 13),
                                  child: Image.network(
                                    recipe.thumbnailImage.url,
                                    height: 106,
                                    width: 106,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  );
                }
              }
            ),
          ),
        );
      }
    );
  }
}