import 'dart:convert';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = "http://192.168.100.3:8080/api/v1";
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  Future<bool> login(String email, String password) async{
    final url = Uri.parse('$baseUrl/auth/login');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    log("ini status code ${response.statusCode}");
    if(response.statusCode == 200){
      log('dia berhasil ke sini');
      final responseData = jsonDecode(response.body);
      log(responseData['data']['token']);
      log(responseData['data']['userId']);
      String token = responseData['data']['token'];
      String userId = responseData['data']['userId'];
      
      await secureStorage.write(key: 'auth_token', value: token);
      await secureStorage.write(key: 'user_id', value: userId);
      return true;
    } else{
      log('dia gagall');
      return false;
    }
  }

  Future<void> logout() async{
    await secureStorage.delete(key: 'auth_token');
    await secureStorage.delete(key: 'user_id');
  }

  Future<bool> isLoggedIn() async{
    final token = await secureStorage.read(key: 'auth_token');
    return token != null;
  }

  Future<String?> getToken() async{
    return await secureStorage.read(key: 'auth_token');
  }
}