import 'package:flutter/material.dart';
import 'package:freshy_food/styles/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.lightGreen,
        title: Text("Home Screen"),
        centerTitle: true,
      ),
      body: Text("This is home screen"),
    );
  }
}