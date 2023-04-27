import 'package:flutter/material.dart';
import 'package:lets_party_frontend/core/authentication/authenticator.dart';
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
    invitations = await _invitationsData.getListOfInvitationsForUser(Authenticator.email);

    for(int i = 0; i < invitations.length; i++){
      invitedParties.add(await _partyData.getParty(invitations[i].partyId));
    }

    isLoadingDone = true;
    notifyListeners();
  }
}