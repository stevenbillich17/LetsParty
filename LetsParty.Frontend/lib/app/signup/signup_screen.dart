import 'package:flutter/material.dart';
import 'package:lets_party_frontend/app/signup/signup_bloc.dart';
import 'package:lets_party_frontend/assets/app_colors.dart';
import 'package:provider/provider.dart';

import 'package:lets_party_frontend/assets/app_styles.dart';

import 'package:lets_party_frontend/assets/app_dimens.dart';
import 'package:lets_party_frontend/app/components/input_field_widgets.dart';
import 'package:lets_party_frontend/app/home/home_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final SignUpBloc bloc = SignUpBloc();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => bloc,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0.0,
            title: const Text(
              'Sign Up',
              style: AppStyles.appBarStyle,
            ),
            leading: TextButton(
              child: const Text('Back'),
              onPressed: () => Navigator.pop(context),
            ),
            centerTitle: true,
            toolbarHeight: 80.0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(AppDimens.padding_2x),
            child: Form(
              key: _formKey,
              child: Consumer<SignUpBloc>(
                builder: (context, signupBloc, child) {
                  return ListView(
                    children: [
                      InputField(
                        hintText: 'Name',
                        onChanged: (val) {bloc.name = val;},
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        validator: (name) {
                          if (name != null && name != '') {
                            return null;
                          }
                          return 'Invalid name';
                        },
                      ),
                      const SizedBox(
                        height: AppDimens.padding_2x,
                      ),
                      InputField(
                        hintText: 'Email',
                        onChanged: (val) {bloc.email = val;},
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
                      InputField(
                        hintText: 'Password',
                        onChanged: (val) {bloc.password = val;},
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            return 'Empty password';
                          }
                          return null;
                        },
                        obscureText: !bloc.visiblePassword,
                        textInputAction: TextInputAction.next,
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
                      ),
                      const SizedBox(
                        height: AppDimens.padding_2x,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await bloc.pickDate(context);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            appYellow.withOpacity(0.5),
                          ),
                        ),
                        child: const Text(
                          'Birthday: 17.12.2001',
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(AppDimens.padding_2x),
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final int? status = await bloc.createAccount(context);
                  if (status == 200) {
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(
                    //     content: Text(message),
                    //   ),
                    // );
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyHomePage(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Error while signing up, try again later!'),
                          ),
                        );
                  }
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
                'Sign Up',
                style: TextStyle(
                  fontSize: 20,
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
