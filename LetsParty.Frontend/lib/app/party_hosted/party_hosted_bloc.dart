import 'package:flutter/material.dart';
import 'package:lets_party_frontend/core/models/invitations_model.dart';
import 'package:lets_party_frontend/core/models/party_model.dart';
import 'package:lets_party_frontend/core/repository/invitations_data.dart';
import 'package:lets_party_frontend/core/repository/party_data.dart';
import 'package:lets_party_frontend/core/repository/user_data.dart';

class PartyHostedBloc extends ChangeNotifier {
  PartyHostedBloc(String partyID) {
    loadParty(partyID);
  }

  final PartyData _partyData = PartyData();
  final InvitationsData _invitationsData = InvitationsData();
  PartyModel? party;
  List<InvitationsModel> partyGuestsComming = [];
  List<InvitationsModel> partyGuestsNotComming = [];
  List<InvitationsModel> partyGuestsNotConfirmed= [];
  String? hostName;
  bool loadingDone = false;

  Future<void> loadParty(String partyID) async {
    party = await _partyData.getParty(partyID);

    hostName = await UsersData.getUserName(party!.hostEmail);

    print(partyID);
    List<InvitationsModel> partyGuests = await _invitationsData.getListOfInvitationsForParty(partyID);

    print(partyGuests);

    partyGuestsComming = partyGuests.where((element) => element.status == 1).toList();
    print(partyGuestsComming);
    partyGuestsNotComming = partyGuests.where((element) => element.status == -1).toList();
    print(partyGuestsComming);
    partyGuestsNotConfirmed = partyGuests.where((element) => element.status == 0).toList();
    print(partyGuestsNotConfirmed);

    loadingDone = true;
    notifyListeners();
  }
}
