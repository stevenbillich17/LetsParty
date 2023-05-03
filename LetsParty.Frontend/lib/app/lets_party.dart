import 'package:flutter/material.dart';
import 'package:lets_party_frontend/app/loading/loading_screen.dart';
import 'package:lets_party_frontend/app/login/login_screen.dart';
import 'package:lets_party_frontend/assets/app_colors.dart';
import 'package:lets_party_frontend/core/authentication/authenticator.dart';
import 'package:lets_party_frontend/core/authentication/jwt_storage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    JwtStorage.loadJwt();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: appThemeData,
      home: const LoadingScreen(),
    );
  }
}
