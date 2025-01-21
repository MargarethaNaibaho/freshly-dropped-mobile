import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:freshy_food/styles/colors.dart';

class AppBarGreen extends StatelessWidget implements PreferredSizeWidget{
  const AppBarGreen({
    super.key, 
    required this.linkBack, 
    required this.linkRight, 
    required this.focusNode, 
    this.isCart = false
  });
  
  final void Function(BuildContext) linkBack;
  final void Function() linkRight;
  final bool isCart;

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: CustomColors.lightGreen,
      toolbarHeight: 86,
      title: Container(
        padding: const EdgeInsets.symmetric(vertical: 21),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(onTap: () => linkBack(context), 
              child: Icon(
                Icons.keyboard_arrow_left_rounded,
                size: 40,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 20,),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 11  , vertical:11),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TextField(
                        focusNode: focusNode,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          hintText: 'Pesto Pasta',
                          hintStyle: TextStyle(
                            color: focusNode.hasFocus ? Colors.black : CustomColors.searchGrey,
                            fontWeight: FontWeight.w300,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(FluentSystemIcons.ic_fluent_search_regular,
                      size: 27,
                      color: CustomColors.searchGrey,
                    ),
                  ],
                ),
              )
            ),
            const SizedBox(width: 20,),
            GestureDetector(onTap: linkRight, 
              child: Icon(
                isCart ? Icons.shopping_cart_outlined : Icons.filter_alt_outlined,
                size: 40,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(86);
}