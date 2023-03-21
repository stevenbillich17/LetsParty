import 'package:flutter/material.dart';
import 'package:lets_party_frontend/app/signup/signup_screen.dart';
import 'package:provider/provider.dart';
import 'package:lets_party_frontend/app/login/login_bloc.dart';
import 'package:lets_party_frontend/assets/app_styles.dart';
import 'package:lets_party_frontend/assets/app_dimens.dart';
import 'package:lets_party_frontend/app/components/input_field_widgets.dart';
import 'package:lets_party_frontend/app/home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginBloc(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0.0,
            title: const Text(
              'log in',
              style: AppStyles.appBarStyle,
            ),
            centerTitle: true,
            toolbarHeight: 80.0,
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => SignUpScreen(),
                    ),
                  );
                },
                child: const Text('Sign Up'),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(AppDimens.padding_2x),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  InputField(
                    hintText: 'Email',
                    onChanged: (val) {
                      _email = val;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    validator: (email) {
                      if (email != null && email != '') {
                        return null;
                      }
                      return 'Invalid email address';
                    },
                  ),
                  const SizedBox(
                    height: AppDimens.padding_2x,
                  ),
                  Consumer<LoginBloc>(
                    builder: (context, bloc, child) {
                      return InputField(
                        hintText: 'Password',
                        onChanged: (val) {
                          _password = val;
                        },
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            return 'Empty password';
                          }
                          return null;
                        },
                        obscureText: !bloc.visiblePassword,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: TextButton(
                          onPressed: () => bloc.changePasswordVisibility(),
                          child: Text(
                            bloc.visiblePassword ? 'Hide' : 'Show',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(AppDimens.padding_2x),
            child: Consumer<LoginBloc>(
              builder: (context, bloc, child) => ElevatedButton(
                onPressed: () async {
                  final bool loginSuccessful =
                  await bloc.login(context, _email, _password);
                  if (loginSuccessful) {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyHomePage(),
                      ),
                    );
                  }
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(
                    Size(
                      MediaQuery.of(context).size.width,
                      55,
                    ),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                ),
                child: const Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}