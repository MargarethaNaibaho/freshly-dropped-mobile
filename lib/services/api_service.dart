import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://192.168.100.81:8080/api/v1";
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  final http.Client _client = http.Client();

  Future<String?> getToken() async{
    return await _storage.read(key: 'auth_token');
  }

  //general get
  Future<Map<String, dynamic>> get(String endpoint) async{
    String? token = await getToken();

    if(token == null){
      throw Exception('Token not found');
    }

    final url = Uri.parse('$baseUrl/$endpoint');
    final response = await _client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },  
    );

    if(response.statusCode == 200){
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> body) async{
    String? token = await getToken();

    if(token == null){
      throw Exception('Token not found');
    }

    final url = Uri.parse('$baseUrl/$endpoint');
    final response = await _client.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer  $token',
      },
      body: json.encode(body),
    );

    if(response.statusCode == 200){
      return json.decode(response.body);
    } else{
      throw Exception('Failed to post data');
    }
  }
}