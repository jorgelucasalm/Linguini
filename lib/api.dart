import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = 'https://api-linguini.herokuapp.com';
  // static const baseUrl = 'http://192.168.1.7:3001';

  static createUser(String username, String password, String email) async {
    final response =
        await http.post(Uri.parse(baseUrl), body: {username, password, email});

    print(response);
  }

  static Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(Uri.parse('$baseUrl/user/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'username': username, 'password': password}));

    Map<String, dynamic> responseJson = jsonDecode(response.body);
    
    return { 'status': response.statusCode, 'message': responseJson['message']};

  }
}
