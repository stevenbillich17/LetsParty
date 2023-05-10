import 'package:flutter/cupertino.dart';
import 'package:lets_party_frontend/core/models/user_model.dart';
import 'package:lets_party_frontend/core/repository/invitations_data.dart';

class InvitePeopleBloc extends ChangeNotifier {
  InvitePeopleBlocc() {
    loadScreen();
  }

  final InvitationsData _invitations_data = InvitationsData();
  List<UserModel> friends = [];
  List<UserModel> invitedPeople = [];
  bool isLoadingDone = false;

  Future<void> loadScreen() async {
    friends = await _invitations_data.getListOfFriend();
    isLoadingDone = true;
    notifyListeners();
  }
}
