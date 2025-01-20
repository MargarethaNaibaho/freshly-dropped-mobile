import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:freshy_food/screens/recipes/individual_recipes_screen.dart';
import 'package:freshy_food/styles/colors.dart';
import 'package:freshy_food/styles/path/image_path.dart';

class SingleCardHalfRecipe extends StatelessWidget {
  const SingleCardHalfRecipe({super.key, required this.hottestRecipe, this.isSvg = false});
  final Map<String, dynamic> hottestRecipe;
  final bool isSvg;

  @override
  Widget build(BuildContext context) {
    double widthForCard = MediaQuery.of(context).size.width / 2 - 36;

    return GestureDetector(
      onTap: (){
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => IndividualRecipesScreen(recipe: hottestRecipe,)));
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
                      image: AssetImage(hottestRecipe['imagePath']),
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
                            Image.asset(ImagePath.chili, width: 16,),
                            Image.asset(ImagePath.shrimp, width: 16,)
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
                        Text("150 kcal${isSvg ? "/svg" : ""}", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 11),),
                      ],
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
}