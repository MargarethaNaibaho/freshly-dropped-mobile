import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freshy_food/styles/colors.dart';
import 'package:freshy_food/styles/path/image_path.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: Text("This is home screen"),
    );
  }
}