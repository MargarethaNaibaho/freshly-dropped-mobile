import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freshy_food/styles/colors.dart';
import 'package:freshy_food/styles/path/image_path.dart';
import 'package:freshy_food/styles/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.lightGreen,
        toolbarHeight: 86,
        title: Container(
          padding: const EdgeInsets.symmetric(vertical: 21, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(image: AssetImage(ImagePath.logo), height: 46,),
              const SizedBox(width: 10,),
              Expanded(
                child: 
                GestureDetector(
                onTap: (){},
                child:  Container(
                    padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Pesto Pasta",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: CustomColors.searchGrey,
                            fontSize: 15
                          ),
                        ),
                        Icon(
                          FluentSystemIcons.ic_fluent_search_regular,
                          size: 27,
                          color: CustomColors.searchGrey,
                        )
                      ],
                    ),
                  ),
                )
              ),
              const SizedBox(width: 10,),
              InkWell(
                onTap: (){}, 
                child: Icon(Icons.shopping_cart_outlined, size: 27, color: Colors.white,),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 13),    
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hottest Recipes", style: TextStyles.titleStyle1,),
              const SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
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
                                  image: AssetImage(hottestRecipes[0]['imagePath']),
                                  fit: BoxFit.cover //ini supaya ikutin width height si container parent yg bungkus ini
                                ),
                              ),
                              height: 100,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}