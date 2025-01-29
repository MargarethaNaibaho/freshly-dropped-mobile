import 'package:flutter/material.dart';
import 'package:freshy_food/base/botton_nav.dart';
import 'package:freshy_food/notifier/recipe_notifier.dart';
import 'package:freshy_food/widgets/app_bar_green.dart';
import 'package:freshy_food/widgets/single_card_half_recipe.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
      create: (context) => RecipeNotifier()..loadAllRecipes(),
      child: Scaffold(
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
          child: Consumer<RecipeNotifier>(
            builder: (context, recipeNotifier, child){
              if(recipeNotifier.isLoading){
                return const Center(child: CircularProgressIndicator());
              } else if(recipeNotifier.listRecipes.isEmpty){
                return const Center(child: Text("No recipes found"));
              }

              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                children: [
                  Wrap(
                    spacing: 19,
                    runSpacing: 24,
                    children: [
                      for(var recipe in recipeNotifier.listRecipes)
                        SingleCardHalfRecipe(hottestRecipe: recipe, isSvg: true,),
                    ],
                  )
                ],
              );
            }
          ),  
        )
      )
    );
  }
}