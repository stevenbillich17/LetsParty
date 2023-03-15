import 'package:flutter/material.dart';

import 'package:lets_party_frontend/app/components/input_field_widgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0.0,
          title: const Text(
            'log in',
          ),
          centerTitle: true,
          toolbarHeight: 80.0,
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text('Sign Up'),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                InputField(
                  hintText: 'Email',
                  onChanged: (val) {},
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
                  height: 32,
                ),
                InputField(
                  hintText: 'Password',
                  onChanged: (val) {},
                  validator: (password) {
                    if (password == null || password.isEmpty) {
                      return 'Empty password';
                    }
                    return null;
                  },
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Hide',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(32),
          child: ElevatedButton(
            onPressed: () {},
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
