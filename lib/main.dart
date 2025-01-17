import 'package:flutter/material.dart';
import 'package:freshy_food/base/botton_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Freshly Dropped',
      theme: ThemeData(fontFamily: 'Inter'),
      home: BottomNavBar(),
    );
  }
}