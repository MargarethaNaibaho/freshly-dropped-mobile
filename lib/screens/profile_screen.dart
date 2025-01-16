import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Profile Screen"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Text(
            "This is profile poppins",
            style: TextStyle(fontFamily: 'Poppins'),
          ),
          Text(
            "This is profile inter",
          ),
        ],
      )
    );
  }
}