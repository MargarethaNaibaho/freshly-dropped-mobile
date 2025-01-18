import 'package:flutter/material.dart';
import 'package:freshy_food/styles/colors.dart';

class HomeIcon extends StatelessWidget {
  const HomeIcon({super.key, required this.title, required this.linkImage});
  final String title;
  final String linkImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      height: 80,
      width: 81,
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
          Text(title, style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: CustomColors.darkGreen),),
        ],
      ),
    );
  }
}