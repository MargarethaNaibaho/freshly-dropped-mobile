import 'package:flutter/material.dart';
import 'package:freshy_food/base/botton_nav.dart';
import 'package:freshy_food/modoels/recipe_overview_model.dart';
import 'package:freshy_food/widgets/app_bar_green.dart';
import 'package:freshy_food/widgets/single_card_half_recipe.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen>{
  final FocusNode focusNode = FocusNode();

  @override
  void dispose(){
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarGreen(linkBack: (context){
        Navigator.pushAndRemoveUntil(
            context, 
            MaterialPageRoute(builder: (context) => BottomNavBar()),
            (Route<dynamic> route) => false,
          );
      }, linkRight: (){}, focusNode: focusNode),
      body: SafeArea(
        minimum: EdgeInsets.zero,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          children: [
            Wrap(
              spacing: 19,
              runSpacing: 24,
              children: [
                for(var recipe in RecipeOverviewModel.recipes)
                  SingleCardHalfRecipe(hottestRecipe: recipe, isSvg: true,),
              ],
            )
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         SingleCardHalfRecipe(hottestRecipe: hottestRecipes[0], isSvg: true,),
            //         const SizedBox(width: 19,),
            //         SingleCardHalfRecipe(hottestRecipe: hottestRecipes[1], isSvg: true,)
            //       ],
            //     ),
            //     const SizedBox(height: 24,),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         SingleCardHalfRecipe(hottestRecipe: hottestRecipes[0], isSvg: true,),
            //       ],
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}