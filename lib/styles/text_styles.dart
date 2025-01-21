import 'package:flutter/material.dart';
import 'package:freshy_food/styles/colors.dart';

class TextStyles {
  static TextStyle titleStyle1(BuildContext context) {
    return TextStyle(
      fontSize: 24 * MediaQuery.textScalerOf(context).scale(1),
      fontFamily: 'Poppins',
    );
  }

  static TextStyle titleStyle2(BuildContext context) {
    return  TextStyle(
      fontSize: 16 * MediaQuery.textScalerOf(context).scale(1),
      fontFamily: 'Poppins',
    );
  }

  static TextStyle descriptionStyle1(BuildContext context) {
    return TextStyle(
      color: CustomColors.primaryGrey, 
      fontSize: 16 * MediaQuery.textScalerOf(context).scale(1), 
      height: 1
    );
  }

  static TextStyle descriptionStyle2(BuildContext context) {
    return TextStyle(
      color: CustomColors.primaryGrey, 
      fontSize: 12 * MediaQuery.textScalerOf(context).scale(1), 
      height: 1
    );
  }
}