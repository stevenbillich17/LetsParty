import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lets_party_frontend/app/home/home_screen.dart';
import 'package:lets_party_frontend/app/login/login_screen.dart';
import 'package:lets_party_frontend/app/signup/signup_screen.dart';
import 'package:lets_party_frontend/assets/app_dimens.dart';
import 'package:lets_party_frontend/assets/app_styles.dart';
import 'package:lets_party_frontend/app/components/input_field_widgets.dart';
import 'package:lets_party_frontend/app/login/login_bloc.dart';
import 'package:provider/provider.dart';

class MockLoginBloc extends ChangeNotifier implements LoginBloc {
  bool _visiblePassword = false;

  bool get visiblePassword => _visiblePassword;

  @override
  Future<int> login(BuildContext context, String? email, String? password) async {
    // Simulate a successful login
    return 200;
  }

  @override
  void changePasswordVisibility() {
    _visiblePassword = !_visiblePassword;
    notifyListeners();
  }

  @override
  String? email;

  @override
  String? password;

  @override
  set visiblePassword(bool _visiblePassword) {
  }
}