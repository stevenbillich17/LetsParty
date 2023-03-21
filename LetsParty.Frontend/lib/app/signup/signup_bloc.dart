import 'package:flutter/material.dart';

class SignUpBloc extends ChangeNotifier {
  String? password;
  bool visiblePassword = false;

  Future<String?> createAccount(BuildContext context) async {
    String? message = null;
    return message;
  }

  void changePasswordVisibility() {
    visiblePassword = !visiblePassword;
    notifyListeners();
  }

  Future<void> pickDate(BuildContext context) async {
    DateTime? date;
    date = await showDatePicker(
      context: context,
      initialDate: DateTime.utc(DateTime.now().year - 20),
      firstDate: DateTime.utc(DateTime.now().year - 80),
      lastDate: DateTime.utc(DateTime.now().year - 10),
    );
    notifyListeners();
  }
}