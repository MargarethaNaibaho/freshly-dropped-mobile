import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
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
                                    image: AssetImage(hottestRecipes[0]['imagePath']),
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
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Pesto Pasta", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),),
                                      Row(
                                        children: [
                                          Image.asset("assets/images/other_icons/chili.png", width: 16,),
                                          Image.asset("assets/images/other_icons/shrimp.png", width: 16,)
                                        ],
                                      )
                                    ],
                                  ),
                                  Text("Wheat, Basil, Pine nuts, Cheese", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 11, fontStyle: FontStyle.italic, color: CustomColors.lighGrey2),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(FluentSystemIcons.ic_fluent_star_filled, color: CustomColors.starGray, size: 12,),
                                              Icon(FluentSystemIcons.ic_fluent_star_filled, color: CustomColors.starGray, size: 12,),
                                              Icon(FluentSystemIcons.ic_fluent_star_filled, color: CustomColors.starGray, size: 12,),
                                              Icon(FluentSystemIcons.ic_fluent_star_filled, color: CustomColors.starGray, size: 12,),
                                              Icon(FluentSystemIcons.ic_fluent_star_half_filled, color: CustomColors.starGray, size: 12,),
                                            ],
                                          ),
                                          Text("(29)",  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 11, fontStyle: FontStyle.italic, color: CustomColors.lighGrey2),)
                                        ],
                                      ),
                                      Text("150 kcal", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 11),)
                                    ],
                                  )
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 19,),
                  Expanded(
                    child: Container(
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
                                    image: AssetImage(hottestRecipes[0]['imagePath']),
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
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Pesto Pasta", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),),
                                      Row(
                                        children: [
                                          Image.asset("assets/images/other_icons/chili.png", width: 16,),
                                          Image.asset("assets/images/other_icons/shrimp.png", width: 16,)
                                        ],
                                      )
                                    ],
                                  ),
                                  Text("Wheat, Basil, Pine nuts, Cheese", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 11, fontStyle: FontStyle.italic, color: CustomColors.lighGrey2),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(FluentSystemIcons.ic_fluent_star_filled, color: CustomColors.starGray, size: 12,),
                                              Icon(FluentSystemIcons.ic_fluent_star_filled, color: CustomColors.starGray, size: 12,),
                                              Icon(FluentSystemIcons.ic_fluent_star_filled, color: CustomColors.starGray, size: 12,),
                                              Icon(FluentSystemIcons.ic_fluent_star_filled, color: CustomColors.starGray, size: 12,),
                                              Icon(FluentSystemIcons.ic_fluent_star_half_filled, color: CustomColors.starGray, size: 12,),
                                            ],
                                          ),
                                          Text("(29)",  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 11, fontStyle: FontStyle.italic, color: CustomColors.lighGrey2),)
                                        ],
                                      ),
                                      Text("150 kcal", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 11),)
                                    ],
                                  )
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Featured", style: TextStyles.titleStyle1,),
              const SizedBox(height: 16,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 186,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(4, 4),
                            blurRadius: 10,
                            spreadRadius: 4,
                          ),
                        ],
                        image: DecorationImage(image: AssetImage("assets/images/male_chef.png"), fit: BoxFit.cover)
                      ),
                    )
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}