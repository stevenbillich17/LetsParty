import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:lets_party_frontend/core/models/user_model.dart';

class EditProfileBloc extends ChangeNotifier {
  EditProfileBloc() {
    user = UserModel('Joe Doe', '01/01/1998');
    profilePicture = 'https://ak.picdn.net/contributors/3038285/avatars/thumb.jpg?t=1596662706493';
    loadScreen();
  }

  late UserModel user;
  late String profilePicture;
  bool isLoadingDone = false;
  bool visiblePassword = false;
  bool? isImagedPicked = false;
  File? image;

  Future<void> loadScreen() async {
    isLoadingDone = true;
    notifyListeners();
  }
}