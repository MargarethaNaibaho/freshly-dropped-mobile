import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:freshy_food/widgets/app_bar_white_with_plus.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWhiteWithPlus(linkBack: (context){
        Navigator.pushAndRemoveUntil(
          context, 
          MaterialPageRoute(builder: (context) => BottomAppBar()),
          (Route<dynamic> route) => false,
        );
      }, 
        linkAdd: (){
          log("Ini tombol tambah diklik");
        }, 
        title: "Favorites"
      ),
    );
  }
}