import 'dart:developer';

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:freshy_food/notifier/recipe_notifier.dart';
import 'package:freshy_food/styles/colors.dart';
import 'package:freshy_food/styles/path/image_path.dart';
import 'package:freshy_food/styles/text_styles.dart';
import 'package:freshy_food/widgets/app_bar_green.dart';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class IndividualRecipesScreen extends StatefulWidget {
  final String id;
  const IndividualRecipesScreen({super.key, required this.id});

  @override
  State<IndividualRecipesScreen> createState() => _IndividualRecipesScreenState();
}

class _IndividualRecipesScreenState extends State<IndividualRecipesScreen> {
  final FocusNode _focusNode = FocusNode();
  bool _isChecked = false;

  @override
  void dispose(){
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log("ini dapat id recipe ${widget.id}");
    double widthForBottomButton = MediaQuery.sizeOf(context).width / 2;

    return ChangeNotifierProvider(
      create: (_) => RecipeNotifier()..initialize(widget.id),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarGreen(
          linkBack:  (context) => Navigator.pop(context), 
          linkRight: (){}, 
          focusNode: _focusNode,
          isCart: true,
        ),
        body: SafeArea(
          minimum: EdgeInsets.zero,
          child: Consumer<RecipeNotifier>(
            builder: (context, recipeNotifier, _){
              return FutureBuilder(
                future: recipeNotifier.recipeDetail, 
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }  else if(recipeNotifier.errorMessage != null){
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.warning, color: Colors.red, size: 48,),
                          const SizedBox(height: 8,),
                          Text(
                            recipeNotifier.errorMessage!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16 * MediaQuery.textScalerOf(context).scale(1),
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(height: 12,),
                          ElevatedButton(
                            onPressed: (){
                              recipeNotifier.initialize(widget.id);
                            }, 
                            child: const Text("Coba lagi"),
                          ),
                        ],
                      ),
                    );
                  } else if(!snapshot.hasData){
                    return Center(
                      child: Text("No recipe detail found"),
                    );
                  } else{
                    final recipe = snapshot.data!;
                    log("$recipe");
                    
                    // String nutritionsText = recipe.listNutritions.map((e) => e.toString()).join(', ');
                    String countriesText = recipe.listCountries.map((e) => e.toString()).join(', ');
                    String mealTypesText = recipe.listRecipeTypes.map((e) => e.toString()).join(', ');
                    
                    return ListView(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 32,),
                              Center(
                                child: Container(
                                  height: 334,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(recipe.detailImage.url),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(recipe.recipeName, style: TextStyles.titleStyle1(context),),
                                      const SizedBox(width: 9,),
                                      SizedBox(
                                        height: 26,
                                        child: Image.asset(ImagePath.shrimp, width: 16,)
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: (){},
                                        child: SvgPicture.asset(
                                          "assets/images/other_icons/upload_svg.svg", 
                                          colorFilter: ColorFilter.mode(CustomColors.primaryGrey, BlendMode.srcIn),
                                          height: 24,
                                        )
                                      ),
                                      const SizedBox(width: 25.8,),
                                      GestureDetector(
                                        onTap: () => recipeNotifier.toggleFavorite(widget.id),
                                        child: SvgPicture.asset(
                                          recipeNotifier.isFavorite 
                                          ? "assets/images/other_icons/love_filled.svg"
                                          : "assets/images/other_icons/love_regular.svg", 
                                          colorFilter: ColorFilter.mode(CustomColors.primaryGrey, BlendMode.srcIn),
                                          height: 24,
                                        )
                                      ),
                                    ],
                                  ),
                                ],
                              ), 
                              const SizedBox(height: 22,),
                              Row(
                                children: [
                                  Wrap(
                                    spacing: 3,
                                    children: [
                                      Icon(
                                        FluentSystemIcons.ic_fluent_star_filled, 
                                        color: CustomColors.lightOrange,
                                      ),
                                      Icon(
                                        FluentSystemIcons.ic_fluent_star_filled, 
                                        color: CustomColors.lightOrange,
                                      ),
                                      Icon(
                                        FluentSystemIcons.ic_fluent_star_filled, 
                                        color: CustomColors.lightOrange,
                                      ),
                                      Icon(
                                        FluentSystemIcons.ic_fluent_star_filled, 
                                        color: CustomColors.lightOrange,
                                      ),
                                      Icon(
                                        FluentSystemIcons.ic_fluent_star_filled, 
                                        color: CustomColors.lightOrange,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 8,),
                                  Text(
                                    "(${recipe.countUserStar})", 
                                    style: TextStyle(
                                      fontSize: 16 * MediaQuery.textScalerOf(context).scale(1), 
                                      color: CustomColors.primaryGrey
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 32,),
                              Text(recipe.description, style: TextStyles.descriptionStyle1(context)),
                              const SizedBox(height: 15,),
                              Wrap(
                                spacing: 8,
                                runSpacing: 7,
                                children: [
                                  Wrap(
                                    spacing: 8,
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    children: [
                                      Image.asset(ImagePath.knifeFork, height: 23,),
                                      Text(mealTypesText, style: TextStyles.descriptionStyle1(context),),
                                    ],
                                  ),
                                  Wrap(
                                    spacing: 8,
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    children: [
                                      Image.asset(ImagePath.globe, height: 23,),
                                      Text(countriesText, style: TextStyles.descriptionStyle1(context),),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Servings", 
                                    style: TextStyle(
                                      fontFamily: 'Poppins', 
                                      fontSize: 20 * MediaQuery.textScalerOf(context).scale(1), 
                                      color: CustomColors.primaryGrey,
                                    )
                                  ),
                                  const SizedBox(width: 16,),
                                  Wrap(
                                    spacing: 16,
                                    children: [
                                      GestureDetector(
                                        onTap: recipeNotifier.decrementCounter,
                                        child: Container(
                                          padding: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(50),
                                            border: Border.all(color: CustomColors.lightGrey, width: 1),
                                          ),
                                          child: Icon(
                                            Icons.remove, 
                                            size: 24, 
                                            color: CustomColors.lightGrey,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                        child: Center(
                                          child: Text(
                                            "${recipeNotifier.counter}", 
                                            style: TextStyle(
                                              fontFamily: 'Poppins', 
                                              fontSize: 20 * MediaQuery.textScalerOf(context).scale(1), 
                                              color: CustomColors.primaryGrey,
                                            ),
                                          )
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: recipeNotifier.incrementCounter,
                                        child: Container(
                                          padding: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(50),
                                            border: Border.all(color: CustomColors.lightGrey, width: 1),
                                          ),
                                          child: Icon(
                                            Icons.add, 
                                            size: 24, 
                                            color: CustomColors.lightGrey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 24,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: CustomColors.primaryGreen,
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(color: CustomColors.primaryGreen, width: 1),
                                    ),
                                    child: Text(
                                      "Ingredients", 
                                      style: TextStyle(
                                        fontFamily: 'Poppins', 
                                        fontSize: 20 * MediaQuery.textScalerOf(context).scale(1), 
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8,),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(color: CustomColors.primaryGrey, width: 1),
                                    ),
                                    child: Text(
                                      "Nutritions", 
                                      style: TextStyle(
                                        fontFamily: 'Poppins', 
                                        fontSize: 20 * MediaQuery.textScalerOf(context).scale(1), 
                                        color: CustomColors.primaryGrey
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start  ,
                                children: [
                                  for(var ingredient in recipe.listIngredients)
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 24,
                                          height: 30,
                                          child: Checkbox(
                                            value: _isChecked, 
                                            onChanged: (bool? newValue){
                                              setState(() {
                                                _isChecked = newValue!;
                                              });
                                            },
                                            activeColor: CustomColors.primaryGreen,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                              side: BorderSide(
                                                color: _isChecked ? CustomColors.primaryGreen : CustomColors.cardGrey
                                              )
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(left: 8), 
                                          child: Text(ingredient.toString(), style: TextStyles.descriptionStyle1(context),)),
                                      ],
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                }
              );

            },
          ),
        ),
        bottomNavigationBar: SafeArea(
          minimum: EdgeInsets.zero,
          child: Container(
            height: 64,
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: CustomColors.primaryGreen)
                    ),
                    width: widthForBottomButton,
                    child: Center(
                      child: Text(
                        "Add to trolley", 
                        style: TextStyle(
                          fontSize: 20 * MediaQuery.textScalerOf(context).scale(1), 
                          color: CustomColors.primaryGreen
                        ),
                      )
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: CustomColors.primaryGreen,
                      border: Border.all(color: CustomColors.primaryGreen)
                    ),
                    width: widthForBottomButton,
                    child: Center(
                      child: Text(
                        "Order now", 
                        style: TextStyle(
                          fontSize: 20 * MediaQuery.textScalerOf(context).scale(1), 
                          color: Colors.white
                        ),
                      )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}