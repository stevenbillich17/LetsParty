import 'package:flutter/material.dart';
import 'package:lets_party_frontend/assets/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:lets_party_frontend/assets/app_dimens.dart';
import 'package:lets_party_frontend/assets/app_styles.dart';
import 'package:lets_party_frontend/app/components/input_field_widgets.dart';
import 'package:lets_party_frontend/app/edit-profile/edit_profile_bloc.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final _editProfileKey = GlobalKey<FormState>();
  String? _password1;
  String? _name;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (BuildContext context) => EditProfileBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'profile',
            style: AppStyles.appBarStyle.copyWith(color: appWhite),
          ),
        ),
        body: SafeArea(
          child: Consumer<EditProfileBloc>(
            builder: (context, bloc, child) {
              if (bloc.isLoadingDone) {
                return ListView(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          color: appYellow,
                          height: 200.0,
                        ),
                        Positioned(
                          top: 70.0,
                          left: screenWidth / 4,
                          child: Container(
                            height: screenWidth / 2,
                            width: screenWidth / 2,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(bloc.profilePicture),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: screenWidth / 4,
                    ),
                    TextButton(
                      onPressed: () async {
                        Future.delayed(
                          const Duration(seconds: 1),
                          () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfileScreen(),
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Change your profile picture',
                        style: AppStyles.bodyStyle
                            .copyWith(color: Colors.grey[300]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppDimens.padding_2x),
                      child: Form(
                        key: _editProfileKey,
                        child: Column(
                          children: [
                            InputField(
                              hintText: 'Name',
                              onChanged: (val) {
                                _name = val;
                              },
                              validator: (name) {
                                if (name == '') {
                                  return 'Empty name';
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(
                              height: AppDimens.padding_2x,
                            ),
                            InputField(
                              hintText: 'Password',
                              onChanged: (val) {
                                _password1 = val;
                              },
                              validator: (password) {
                                if (password == '') {
                                  return 'The password is empty';
                                } else {
                                  return null;
                                }
                              },
                              obscureText: !bloc.visiblePassword,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.visiblePassword,
                            ),
                            const SizedBox(
                              height: AppDimens.padding_2x,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.padding,
            vertical: AppDimens.padding_3x,
          ),
          child: ElevatedButton(
            onPressed: () async {
              final bool isValidated = _editProfileKey.currentState!.validate();
              if (isValidated) {}
            },
            style: ButtonStyle(
              fixedSize:
                  MaterialStateProperty.all(const Size(double.infinity, 60.0)),
            ),
            child: const Text('Save changes'),
          ),
        ),
      ),
    );
  }
}
