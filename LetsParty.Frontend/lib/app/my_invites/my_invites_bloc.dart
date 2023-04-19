import 'package:flutter/material.dart';

import 'package:lets_party_frontend/core/models/party_model.dart';
import 'package:lets_party_frontend/core/repository/party_data.dart';


class MyInvitesBloc extends ChangeNotifier {

  List<String> partyIDs = [];
  final List<PartyModel> invitedParties = [];
  bool isLoadingDone = false;


  MyInvitesBloc() {
    loadScreen();
  }

  Future<void> loadScreen() async {
    partyIDs = ['argnonijanwo', 'slngkaagbkjhaaijf']; //todo: call to backend here

    for(final String id in partyIDs) {
      invitedParties.add(await getPartyDetails(id)); //todo: also call to backend
    }
    isLoadingDone = true;
    notifyListeners();
  }

  Future<PartyModel> getPartyDetails(String id) {
    PartyData p = PartyData();
    return p.getParty(id);
  }

}