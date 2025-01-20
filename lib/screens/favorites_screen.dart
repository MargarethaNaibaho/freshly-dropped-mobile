import 'dart:developer';

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
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
    double widthForOuterCard = MediaQuery.of(context).size.width - 24;

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
      body: ListView.builder(
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
                  // margin: const EdgeInsets.symmetric(horizontal: 24, ),
                  backgroundColor: CustomColors.primaryGreen,
                  content: Text("${recipe['name']} dihapus dari favoritmu", style: TextStyle(fontSize: 16, color: Colors.white),),
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
              margin: const EdgeInsets.only(left: 24, bottom: 20),
              width: willBeDeleted ? widthForOuterCard : widthForOuterCard - 24,
              height: 112,
              decoration: BoxDecoration(
                color: CustomColors.cardGrey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Container(
                    width: widthForOuterCard - 168,
                    padding: const EdgeInsets.fromLTRB(16, 10, 0, 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(recipe['name'], style: TextStyles.titleStyle2,),
                        const SizedBox(height: 8,),
                        Text(recipe['description'], style: TextStyles.descriptionStyle2,),
                        const SizedBox(height: 4,),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(FluentSystemIcons.ic_fluent_star_filled, color: CustomColors.lightOrange, size: 24,),
                                Icon(FluentSystemIcons.ic_fluent_star_filled, color: CustomColors.lightOrange, size: 24,),
                                Icon(FluentSystemIcons.ic_fluent_star_filled, color: CustomColors.lightOrange, size: 24,),
                                Icon(FluentSystemIcons.ic_fluent_star_filled, color: CustomColors.lightOrange, size: 24,),
                                Icon(FluentSystemIcons.ic_fluent_star_half_filled, color: CustomColors.lightOrange, size: 24,),
                              ]
                            ),
                            Text("(${recipe['countUserStar']})", style: TextStyles.descriptionStyle2,),
                          ],
                        )
                      ],
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
          );
        }
      ),
    );
  }
}