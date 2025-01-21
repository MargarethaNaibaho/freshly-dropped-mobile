import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:freshy_food/styles/colors.dart';

class HomeIcon extends StatelessWidget {
  const HomeIcon({super.key, required this.title, required this.linkImage});
  final String title;
  final String linkImage;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        bool isTooSmall = constraints.maxWidth < 360;
        double widthForIconCard = constraints.maxWidth / 4 - (isTooSmall ? 4 : 16);

        log("${constraints.maxWidth} $isTooSmall");
        log("font size ${(constraints.maxWidth * 0.03)}");

        return SizedBox(
          width: isTooSmall ? widthForIconCard - 7 : widthForIconCard,
          child: Container(
            padding: const EdgeInsets.all(6),
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: CustomColors.darkGreen, width: 1)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage(linkImage), width: 40, height: 40,),
                const SizedBox(height: 8,),
                Text(
                  title, 
                  style: TextStyle(
                    fontFamily: 'Poppins', 
                    fontSize: (constraints.maxWidth * 0.03).clamp(8.0, 12.0), 
                    color: CustomColors.darkGreen
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}