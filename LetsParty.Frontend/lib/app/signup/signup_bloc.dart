import 'package:flutter/material.dart';
import 'package:lets_party_frontend/core/authentication/authenticator.dart';

class SignUpBloc extends ChangeNotifier {
  String? name;
  String? email;
  String? password;
  DateTime? dateTime;
  bool visiblePassword = false;

  Future<int?> createAccount(BuildContext context) async {
    if (name == null || email == null || password == null || dateTime == null) {
      return null;
    } else {
      return Authenticator.register(name!, email!, password!, dateTime!);
    }
  }

  void changePasswordVisibility() {
    visiblePassword = !visiblePassword;
    notifyListeners();
  }

  Future<void> pickDate(BuildContext context) async {
    dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.utc(DateTime.now().year - 20),
      firstDate: DateTime.utc(DateTime.now().year - 80),
      lastDate: DateTime.utc(DateTime.now().year - 10),
    );
    notifyListeners();
  }
}