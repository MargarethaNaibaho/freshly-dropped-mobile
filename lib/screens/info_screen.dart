import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Info Screen"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            "This is info poppins",
            style: TextStyle(fontFamily: 'Poppins'),
          ),
          Text(
            "This is info inter",
          ),
        ],
      )
      
    );
  }
}