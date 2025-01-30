import 'dart:developer';

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:freshy_food/notifier/favorite_notifier.dart';
import 'package:freshy_food/screens/recipes/individual_recipes_screen.dart';
import 'package:freshy_food/styles/colors.dart';
import 'package:freshy_food/styles/path/image_path.dart';
import 'package:freshy_food/styles/text_styles.dart';
import 'package:freshy_food/widgets/app_bar_white_with_plus.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteNotifier()..loadFavoriteRecipes(),
      child: LayoutBuilder(
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
              child: Consumer<FavoriteNotifier>(
                builder: (context, favoriteNotifier, child){
                  if(favoriteNotifier.isLoading){
                    return const Center(child: CircularProgressIndicator(),);
                  } else if(favoriteNotifier.errorMessage != null){
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.warning, color: Colors.red, size: 48,),
                          const SizedBox(height: 8,),
                          Text(
                            favoriteNotifier.errorMessage!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16 * MediaQuery.textScalerOf(context).scale(1),
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(height: 12,),
                          ElevatedButton(
                            onPressed: (){
                              favoriteNotifier.loadFavoriteRecipes();
                            }, 
                            child: const Text("Coba lagi"),
                          ),
                        ],
                      ),
                    );
                  } else if(favoriteNotifier.favoriteRecipes.isEmpty){
                    return const Center(child: Text("No favorites found"),);
                  }
                  
                  return ListView.builder(
                    itemCount: favoriteNotifier.favoriteRecipes.length,
                    itemBuilder: (context, index){
                      final recipe = favoriteNotifier.favoriteRecipes[index];

                      return Dismissible(
                        key: Key(recipe.recipeId.toLowerCase()), 
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) async {
                          try{
                            await favoriteNotifier.toggleFavorite(recipe.recipeId);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: favoriteNotifier.errorMessage != null 
                                  ? Colors.red 
                                  : CustomColors.primaryGreen,
                                content: Text(
                                  favoriteNotifier.errorMessage != null 
                                  ? "${recipe.recipeName} GAGAL dihapus dari favoritmu"
                                  : "${recipe.recipeName} dihapus dari favoritmu", 
                                  style: TextStyle(
                                    fontSize: 16 * MediaQuery.textScalerOf(context).scale(1), 
                                    color: Colors.white
                                  ),
                                ),
                                duration: const Duration(seconds: 4),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          } catch(e){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  "Gagal hapus ${recipe.recipeName} dari favorite.",
                                  style: TextStyle(
                                    fontSize: 16 * MediaQuery.textScalerOf(context).scale(1), 
                                    color: Colors.white
                                  ),
                                ),
                                duration: const Duration(seconds: 4),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          }
                          
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
              ),
            ),
          );
        }
      )
    );
  }
}