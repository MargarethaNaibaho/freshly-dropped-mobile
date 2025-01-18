import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:freshy_food/styles/colors.dart';
import 'package:freshy_food/widgets/single_card_half_recipe.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen>{
  final FocusNode focusNode = FocusNode();

  final List<Map<String, dynamic>> hottestRecipes = const [
    {
      'id': 1,
      'name': 'Pesto Pasta',
      'calories': 150,
      'countUserStar': 29,
      'ingredients': ['Wheat', 'Basil', 'Pine nuts', 'Cheese'],
      'imagePath': "assets/images/pesto_pasta.png"
    },
    {
      'id': 2,
      'name': 'Lorem Ipsum',
      'calories': 150,
      'countUserStar': 29,
      'ingredients': ['Lorem', 'Ipsum', 'Dolor'],
      'imagePath': "assets/images/pesto_pasta.png"
    },
    {
      'id': 3,
      'name': 'Lorem Syay',
      'calories': 150,
      'countUserStar': 29,
      'ingredients': ['Lorem', 'Ipsum', 'Dolor'],
      'imagePath': "assets/images/pesto_pasta.png"
    },
  ];

  @override
  void dispose(){
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.lightGreen,
        toolbarHeight: 86,
        title: Container(
          padding: const EdgeInsets.symmetric(vertical: 21),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(onTap: (){}, 
                child: Icon(
                  Icons.keyboard_arrow_left_rounded,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 20,),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: TextField(
                          focusNode: focusNode,
                          style: TextStyle(
                            color: focusNode.hasFocus ? Colors.black : CustomColors.searchGrey,
                            fontWeight: FontWeight.w300,
                          ),
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            hintText: 'Pesto Pasta',
                            hintStyle: TextStyle(
                              color: focusNode.hasFocus ? Colors.black : CustomColors.searchGrey,
                              fontWeight: FontWeight.w300,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(onPressed: (){}, 
                        icon: Icon(
                          FluentSystemIcons.ic_fluent_search_regular,
                          size: 27,
                          color: CustomColors.searchGrey,
                        ),
                      ),
                    ],
                  ),
                )
              ),
              const SizedBox(width: 20,),
              GestureDetector(onTap: (){}, 
                child: Icon(
                  Icons.filter_alt_outlined,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SingleCardHalfRecipe(hottestRecipe: hottestRecipes[0], isSvg: true,),
                  const SizedBox(width: 19,),
                  SingleCardHalfRecipe(hottestRecipe: hottestRecipes[1], isSvg: true,)
                ],
              ),
              const SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SingleCardHalfRecipe(hottestRecipe: hottestRecipes[0], isSvg: true,),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}