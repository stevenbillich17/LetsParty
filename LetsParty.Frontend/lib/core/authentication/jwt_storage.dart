
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class JwtStorage {

  static String _jwt = '';
  static String _email = '';

  static getJwt() async {
    if (_jwt == '') {
      await JwtStorage.loadJwt();
    }
    return _jwt;
  }

  static getEmail() async {
    if (_email == '') {
      await JwtStorage.loadEmail();
    }
    return _email;
  }

  static set jwt(String jwt) {
    _jwt = jwt;
  }

  static setEmail(String email) {
    _email = email;
  }

  static Future<void> loadEmail() async {
    const storage = FlutterSecureStorage();
    _email = await storage.read(key: 'email') ?? '';
  }

  static Future<void> loadJwt() async {
    const storage = FlutterSecureStorage();
    _jwt = await storage.read(key: 'jwt') ?? '';
  }

  static storeEmail(String email) {
    const storage = FlutterSecureStorage();
    storage.write(key: 'email', value: email);
  }

  static storeJwt(String jwt) {
    const storage = FlutterSecureStorage();
    storage.write(key: 'jwt', value: jwt);
  }
}