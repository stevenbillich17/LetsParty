import 'package:flutter/material.dart';
import 'package:lets_party_frontend/app/home/home_screen.dart';
import 'package:lets_party_frontend/app/login/login_screen.dart';
import 'package:lets_party_frontend/core/authentication/authenticator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late Future<bool> _isJwtValid;

  @override
  void initState() {
    super.initState();
    _isJwtValid = Authenticator.verifyIfJwtIsValid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<bool>(
          future: _isJwtValid,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!) {
                return const MyHomePage();
              } else {
                return LoginScreen();
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
