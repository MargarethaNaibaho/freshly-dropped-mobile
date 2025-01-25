import 'dart:developer';

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:freshy_food/modoels/recipe_overview_model.dart';
import 'package:freshy_food/screens/recipes/individual_recipes_screen.dart';
import 'package:freshy_food/styles/colors.dart';
import 'package:freshy_food/styles/path/image_path.dart';

class SingleCardHalfRecipe extends StatelessWidget {
  const SingleCardHalfRecipe({
    super.key, 
    required this.hottestRecipe, 
    this.isSvg = false
  });

  final RecipeOverviewModel hottestRecipe;
  final bool isSvg;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        double widthForCard = constraints.maxWidth / 2 - 10;

        String nutritionsText = hottestRecipe.listNutritions.map((e) => e.toString()).join(', ');
        log("ini dr hottest recipe langsung nutritionnya: ${hottestRecipe.listNutritions}");
        String recipeName = hottestRecipe.recipeName;

        int dynamicNutritionsText = (constraints.maxWidth / 20).floor();
        int dynamicRecipeName = (constraints.maxWidth / 35).floor();
        log("$dynamicRecipeName");

        if(nutritionsText.length > dynamicNutritionsText){
          nutritionsText = '${nutritionsText.substring(0, dynamicNutritionsText)}...';
        }

        if(hottestRecipe.recipeName.length > dynamicRecipeName){
          recipeName = '${hottestRecipe.recipeName.substring(0,dynamicRecipeName)}...';
        }

        return GestureDetector(
          onTap: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => IndividualRecipesScreen(id:hottestRecipe.recipeId)));
          },
          child: Container(
            width: widthForCard,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  offset: Offset(4, 4),
                  blurRadius: 4
                ),
              ],
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                      decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(hottestRecipe.thumbnailImage.url),
                        fit: BoxFit.cover //ini supaya ikutin width height si container parent yg bungkus ini
                      ),
                    ),
                    height: 100,
                  ),
                ),
                const SizedBox(height: 5,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              recipeName, 
                              style: TextStyle(
                                fontWeight: FontWeight.w500, 
                                fontSize: 14
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Row(
                            children: [
                              Image.asset(ImagePath.chili, width: 16,),
                              Image.asset(ImagePath.shrimp, width: 16,)
                            ],
                          ),
                        ],
                      ),
                      Text(
                        nutritionsText, 
                        style: TextStyle(
                          fontWeight: FontWeight.w300, 
                          fontSize: 11, 
                          fontStyle: FontStyle.italic, 
                          color: CustomColors.lighGrey2
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 2 - 52,
                        child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          spacing: 8,
                          children: [
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Wrap(
                                  alignment: WrapAlignment.start,
                                  children: [
                                    Icon(
                                      FluentSystemIcons.ic_fluent_star_filled, 
                                      color: CustomColors.starGray, 
                                      size: constraints.maxWidth < 600 ? 10 : 12,
                                    ),
                                    Icon(
                                      FluentSystemIcons.ic_fluent_star_filled, 
                                      color: CustomColors.starGray, 
                                      size: constraints.maxWidth < 600 ? 10 : 12,
                                    ),
                                    Icon(
                                      FluentSystemIcons.ic_fluent_star_filled, 
                                      color: CustomColors.starGray, 
                                      size: constraints.maxWidth < 600 ? 10 : 12,
                                    ),
                                    Icon(
                                      FluentSystemIcons.ic_fluent_star_filled, 
                                      color: CustomColors.starGray, 
                                      size: constraints.maxWidth < 600 ? 10 : 12,
                                    ),
                                    Icon(
                                      FluentSystemIcons.ic_fluent_star_half_filled, 
                                      color: CustomColors.starGray, 
                                      size: constraints.maxWidth < 600 ? 10 : 12,
                                    ),
                                  ],
                                ),
                                Text(
                                  "(${hottestRecipe.countUserStar})",  
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300, 
                                    fontSize: (constraints.maxWidth * 0.025).clamp(8.0, 11.0), 
                                    fontStyle: FontStyle.italic, 
                                    color: CustomColors.lighGrey2
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "${hottestRecipe.calorie} kcal${isSvg ? "/svg" : ""}", 
                              style: TextStyle(
                                fontWeight: FontWeight.w300, 
                                fontSize: (constraints.maxWidth * 0.025).clamp(8.0, 11.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 9,)
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
        
      }
    
    );
  }
}