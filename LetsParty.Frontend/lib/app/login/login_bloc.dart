import 'package:flutter/material.dart';
import 'package:lets_party_frontend/core/authentication/authenticator.dart';

class LoginBloc extends ChangeNotifier {
  String? email;
  String? password;
  bool visiblePassword = false;

  Future<int> login(BuildContext context, String? email, String? password) async {
    this.email = email;
    this.password = password;
    if (email == null || password == null) return -1;
    return Authenticator.authenticate(email!, password!);
  }

  void changePasswordVisibility() {
    visiblePassword = !visiblePassword;
    notifyListeners();
  }
}