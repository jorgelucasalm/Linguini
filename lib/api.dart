import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = 'https://api-linguini.herokuapp.com';
  // static const baseUrl = 'http://192.168.1.7:3001';

  static Future<Map<String, dynamic>> createUser(
      String username, String password, String email) async {
    final response = await http.post(Uri.parse('$baseUrl/user'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
          'email': email
        }));

    Map<String, dynamic> responseJson = jsonDecode(response.body);
    return {'status': response.statusCode, 'message': responseJson['message']};
  }

  static Future<Map<String, dynamic>> login(
      String username, String password) async {
    final response = await http.post(Uri.parse('$baseUrl/user/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'username': username, 'password': password}));

    Map<String, dynamic> responseJson = jsonDecode(response.body);

    return {'status': response.statusCode, 'message': responseJson['message']};
  }

  static Future<List<dynamic>> listRecipes(List<String> ingredients) async {
    final response = await http.post(Uri.parse('$baseUrl/data'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, List<String>>{'ingredients': ingredients}));

    List<dynamic> responseJson = jsonDecode(response.body);

    return responseJson;
  }

  static Future<dynamic> getRecipe(int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/data/' + id.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    Object responseJson = jsonDecode(response.body);
    print(response.body);
    return responseJson;
  }

  static Future<List<String>> getIngredients() async {
    final response = await http.get(
      Uri.parse('$baseUrl/ingredients'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    List<dynamic> responseJson = jsonDecode(response.body);
    List<String> responseString =
        responseJson.map((e) => e.toString()).toList();

    return responseString;
  }
}
