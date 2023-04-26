import 'package:flutter/material.dart';
import 'package:lets_party_frontend/core/models/invitations_model.dart';
import 'package:lets_party_frontend/core/repository/invitations_data.dart';
import 'package:lets_party_frontend/core/repository/party_data.dart';
import 'package:lets_party_frontend/core/models/party_model.dart';

class MyInvitesBloc extends ChangeNotifier {
  MyInvitesBloc() {
    loadScreen();
  }

  final InvitationsData _invitationsData = InvitationsData();
  final PartyData _partyData = PartyData();
  bool isLoadingDone = false;
  List<InvitationsModel> invitations = [];
  List<PartyModel> invitedParties = [];

  Future<void> loadScreen() async {
    //TODO: change from hardcoded email to user email
    invitations = await _invitationsData.getListOfInvitationsForUser('diana@mail.com');

    for(int i = 0; i < invitations.length; i++){
      invitedParties.add(await _partyData.getParty(invitations[i].partyId));
    }

    isLoadingDone = true;
    notifyListeners();
  }
}