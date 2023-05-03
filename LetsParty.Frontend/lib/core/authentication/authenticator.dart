import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lets_party_frontend/core/authentication/jwt_storage.dart';

class Authenticator {
  static const String _registerUrl = 'http://10.0.2.2:8081/api/v1/auth/register';
  static const String _authUrl = 'http://10.0.2.2:8081/api/v1/auth/authenticate';
  static const String _tokenVerifyUrl = 'http://10.0.2.2:8081/api/v1/verifyToken';


  static String token = '';
  static String email = '';


  static Future<int> register(String name, String email, String password, DateTime dateTime) async {
    Map<String, dynamic> body = {
      'name': name,
      'email': email,
      'password': password,
      'birthday' : dateTime.toIso8601String()
    };
    Map<String, String> header = {
      'Content-Type': 'application/json'
    };

    // send request
    var request = http.Request('POST', Uri.parse(_registerUrl));
    request.headers.addAll(header);
    request.body = jsonEncode(body);

    // get response
    var response = await http.Client().send(request);
    String responseBody = await response.stream.bytesToString();
    Map<String, dynamic> jsonResponse = json.decode(responseBody);

    token = jsonResponse['token'];
    Authenticator.email = email;

    JwtStorage.storeJwt(token);
    JwtStorage.storeEmail(email);
    return response.statusCode;
  }


  static Future<int> authenticate(String email, String password) async {
    Map<String, dynamic> body = {
      'email': email,
      'password': password
    };
    Map<String, String> header = {
      'Content-Type': 'application/json'
    };

    // send request
    var request = http.Request('POST', Uri.parse(_authUrl));
    request.headers.addAll(header);
    request.body = jsonEncode(body);

    // get response
    var response = await http.Client().send(request);
    String responseBody = await response.stream.bytesToString();
    Map<String, dynamic> jsonResponse = json.decode(responseBody);

    token = jsonResponse['token'];
    Authenticator.email = email;

    JwtStorage.storeJwt(token);
    JwtStorage.storeEmail(email);
    return response.statusCode;

  }

  static getJwt() async{
    if (token == '') {
      token =  await JwtStorage.getJwt();
    }
    return token;
  }

  static getEmail() async {
    if (email == '') {
      email = await JwtStorage.getEmail();
    }
    return email;
  }

  static Future<bool> verifyIfJwtIsValid() async {
    await getJwt();
    await getEmail();
    final Map<String, String> headers = {
      'Authorization': 'Bearer ${Authenticator.token}',
      'Content-Type': 'application/json'
    };
    final response = await http.get(Uri.parse(_tokenVerifyUrl), headers: headers);
    return response.statusCode == 200;
  }


}