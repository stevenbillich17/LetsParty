import 'package:flutter/material.dart';

class LoginBloc extends ChangeNotifier {
  bool visiblePassword = false;

  Future<bool> login(
      BuildContext context, String? email, String? password) async {
    const String errorMessage = "";
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(errorMessage ?? "Authentication successful"),
      ),
    );
    return true;
  }

  void changePasswordVisibility() {
    visiblePassword = !visiblePassword;
    notifyListeners();
  }
}