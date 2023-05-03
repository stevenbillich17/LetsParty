
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class JwtStorage {

  static String _jwt = '';

  static getJwt() async {
    if (_jwt == '') {
      await JwtStorage.loadJwt();
    }
    return _jwt;
  }

  static set jwt(String jwt) {
    _jwt = jwt;
  }

  static Future<void> loadJwt() async {
    const storage = FlutterSecureStorage();
    _jwt = await storage.read(key: 'jwt') ?? '';
    print('jwt: $_jwt');
  }

  static storeJwt(String jwt) {
    const storage = FlutterSecureStorage();
    storage.write(key: 'jwt', value: jwt);
    print('jwt: $_jwt');
  }
}