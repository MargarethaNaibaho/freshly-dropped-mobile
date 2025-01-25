import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:freshy_food/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final AuthService authService = AuthService();

  bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() async{
    setState(() {
      isLoading = true;
    });

    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    bool success = await  authService.login(email, password);

    setState(() {
      isLoading = false;
    });

    if(success){
      log("Login success");
      if(mounted){
        Navigator.pushReplacementNamed(context, '/home');
      }

    } else{
      log("Login gagal");
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login gagal. Periksa email dan password")),
        );
      }
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email"
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password"
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: _handleLogin, 
              child: Text("Login")
            )
          ],
        ),
      ),
    );
  }
}