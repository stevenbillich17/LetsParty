import 'dart:convert';
import 'package:lets_party_frontend/core/authentication/authenticator.dart';
import 'package:http/http.dart' as http;
import 'package:lets_party_frontend/core/models/user_model.dart';

class UsersData {
  UsersData();

  static String _apiPath = 'http://10.0.2.2:8081/api/v1/users';

  static Map<String, String> _headers = {
    "Authorization": "Bearer ${Authenticator.token}"
  };

  static Future<String> getUserName(String email) async {
    final response = await http.get(Uri.parse('$_apiPath/find/$email'), headers: _headers);
    if (response.statusCode == 200) {
      String data = response.body;
      print("here $data");
      return data;
    } else {
      return email;
    }
  }

  Future<List<UserModel>> getAllUsers(String mail) async {
    final response = await http.get(Uri.parse('$_apiPath/invited/$mail'), headers: _headers);
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data.');
    }
  }
}