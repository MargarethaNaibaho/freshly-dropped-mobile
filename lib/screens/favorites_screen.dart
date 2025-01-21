import 'dart:developer';

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:freshy_food/screens/recipes/individual_recipes_screen.dart';
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
  final List<Map<String, dynamic>> favoriteRecipes = [
    {
      'id': 1,
      'name': 'Pesto Pasta',
      'countUserStar': 29,
      'imagePath': "assets/images/pesto_pasta_detail.png",
      'description': "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    },
    {
      'id': 2,
      'name': 'Lobster Bisque',
      'countUserStar': 36,
      'imagePath': "assets/images/lobster_bisque.png",
      'description': "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    },
    {
      'id': 3,
      'name': 'Veggie Pizza',
      'countUserStar': 29,
      'imagePath': "assets/images/veggie_pizza.png",
      'description': "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    },
    {
      'id': 4,
      'name': 'Chocolate Muffin',
      'countUserStar': 26,
      'imagePath': "assets/images/chocolate_muffin.png",
      'description': "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    },
    {
      'id': 5,
      'name': 'Capresse Salad',
      'countUserStar': 29,
      'imagePath': "assets/images/caprese_salad.png",
      'description': "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    },
    {
      'id': 6,
      'name': 'Pomodoro Pasta',
      'countUserStar': 39,
      'imagePath': "assets/images/pesto_pasta_detail.png",
      'description': "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    },
  ];

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
            child: ListView.builder(
              itemCount: favoriteRecipes.length,
              itemBuilder: (context, index){
                final recipe = favoriteRecipes[index];

                return Dismissible(
                  key: Key(recipe['id'].toString()), 
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      favoriteRecipes.removeAt(index);
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: CustomColors.primaryGreen,
                        content: Text(
                          "${recipe['name']} dihapus dari favoritmu", 
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
                            builder: (context) => IndividualRecipesScreen(id: recipe['id'])
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
                                  Text(recipe['name'], style: TextStyles.titleStyle2(context),),
                                  const SizedBox(height: 8,),
                                  Text(recipe['description'], style: TextStyles.descriptionStyle2(context),),
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
                                      Text("(${recipe['countUserStar']})", style: TextStyles.descriptionStyle2(context),),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 25,),
                          Container(
                            margin: const EdgeInsets.only(right: 13),
                            child: Image.asset(recipe['imagePath'], height: 106, width: 106,),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            ),
          ),
        );
      }
    );
  }
}