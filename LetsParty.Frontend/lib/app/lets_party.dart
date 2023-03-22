import 'package:flutter/material.dart';
import 'package:lets_party_frontend/app/home/home_screen.dart';
import 'package:lets_party_frontend/app/login/login_screen.dart';
import 'package:lets_party_frontend/assets/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appThemeData,
      home: LoginScreen(),
    );
  }
}
