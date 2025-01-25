import 'package:flutter/material.dart';
import 'package:freshy_food/services/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _handleLogout(BuildContext context) async{
    final authService = AuthService();

    await authService.logout();
    
    Navigator.pushReplacementNamed(context, '/login');
  }

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
            "This is profile page",
            style: TextStyle(fontFamily: 'Poppins'),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () => _handleLogout(context), 
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.all(24),
            ),
            child: const Text(
              "Logout",
              style: TextStyle(color: Colors.white),
            )
          ),
        ],
      )
    );
  }
}