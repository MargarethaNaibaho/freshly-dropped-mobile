import 'package:flutter/material.dart';
import 'package:freshy_food/styles/colors.dart';

class AppBarWhiteWithPlus extends StatelessWidget implements PreferredSizeWidget{
  const AppBarWhiteWithPlus({super.key, required this.linkBack, required this.linkAdd, required this.title});
  final void Function(BuildContext) linkBack;
  final void Function() linkAdd;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 86,
      title: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 21),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(onTap: () => linkBack(context),
                    child: Icon(Icons.keyboard_arrow_left_rounded, size: 40, color: CustomColors.lightGreen),
                  ),
                  Text(
                    "Info",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      color: CustomColors.primaryGreen
                    ),
                  ),
                  GestureDetector(
                    onTap: linkAdd, 
                    child: Icon(Icons.add, size: 40, color: CustomColors.lightGreen,),
                  ),
                ],
              ),
            )
          ),
        ],
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(86);
}