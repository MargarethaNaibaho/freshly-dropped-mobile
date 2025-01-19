import 'package:flutter/material.dart';
import 'package:freshy_food/widgets/app_bar_green.dart';

class IndividualRecipesScreen extends StatefulWidget {
  const IndividualRecipesScreen({super.key, required this.recipe});
  final Map<String, dynamic> recipe;

  @override
  State<IndividualRecipesScreen> createState() => _IndividualRecipesScreenState();
}

class _IndividualRecipesScreenState extends State<IndividualRecipesScreen> {
  final FocusNode focusNode = FocusNode();

  @override
  void dispose(){
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarGreen(linkBack: (context) => Navigator.pop(context), 
        linkRight: (){}, 
        focusNode: focusNode,
        isCart: true,
      ),
    );
  }
}