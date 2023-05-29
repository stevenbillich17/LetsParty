import 'package:flutter/material.dart';
import 'package:lets_party_frontend/core/models/invitations_model.dart';
import 'package:lets_party_frontend/core/models/party_model.dart';
import 'package:lets_party_frontend/core/repository/invitations_data.dart';
import 'package:lets_party_frontend/core/repository/party_data.dart';

class PartyHostedBloc extends ChangeNotifier {
  PartyHostedBloc(String partyID) {
    loadParty(partyID);
  }

  final PartyData _partyData = PartyData();
  final InvitationsData _invitationsData = InvitationsData();
  PartyModel? party;
  List<InvitationsModel> partyGuests = [];
  String? hostName;
  bool loadingDone = false;

  Future<void> loadParty(String partyID) async {
    party = await _partyData.getParty(partyID);
    partyGuests = await _invitationsData.getListOfInvitationsForParty(partyID);
    print(partyGuests);
    hostName = party!.hostEmail;
    loadingDone = true;
    notifyListeners();
  }
}
