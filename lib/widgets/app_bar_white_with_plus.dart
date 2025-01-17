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
      title: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(onPressed: () => linkBack(context),
                    icon: 
                    Icon(Icons.keyboard_arrow_left_rounded, size: 40, color: CustomColors.lightGreen),
                  ),
                  Text(
                    "Info",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      color: CustomColors.primaryGreen
                    ),
                  ),
                  IconButton(
                    onPressed: linkAdd, 
                    icon: Icon(Icons.add, size: 40, color: CustomColors.lightGreen,),),
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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}