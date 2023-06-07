import 'package:flutter/material.dart';
import 'package:lets_party_frontend/core/authentication/authenticator.dart';
import 'package:lets_party_frontend/core/models/invitations_model.dart';
import 'package:lets_party_frontend/core/models/party_model.dart';
import 'package:lets_party_frontend/core/repository/invitations_data.dart';
import 'package:lets_party_frontend/core/repository/party_data.dart';
import 'package:lets_party_frontend/core/repository/user_data.dart';

class PartyInviteBloc extends ChangeNotifier {
  PartyInviteBloc(String partyID) {
    loadParty(partyID);
  }

  final PartyData _partyData = PartyData();
  final InvitationsData _invitationsData = InvitationsData();
  PartyModel? party;
  List<InvitationsModel> partyGuests = [];
  String? hostName;
  bool loadingDone = false;
  int currentStatus = 0;
  Map<String, String> names = {};

  Future<void> loadParty(String partyID) async {
    party = await _partyData.getParty(partyID);
    partyGuests = await _invitationsData.getListOfInvitationsForParty(partyID);
    partyGuests.where((element) => element.status == 1);
    currentStatus = await getInvitationStatus(partyID, Authenticator.email);
    print("status + $currentStatus");
    print(partyGuests);

    for (var i = 0; i < partyGuests.length; i++) {
      names[partyGuests[i].invitedEmail] = await UsersData.getUserName(partyGuests[i].invitedEmail);
    }

    hostName = party!.hostEmail;
    loadingDone = true;
    notifyListeners();
  }

  void acceptInvitation(String partyId, String mail) async {
    loadingDone = false;
    notifyListeners();
    InvitationsData.acceptInvitation(partyId, mail);
    currentStatus = 1;
    loadingDone = true;
    notifyListeners();
  }

  void declineInvitation(String partyId, String mail) async {
    loadingDone = false;
    notifyListeners();
    InvitationsData.declineInvitation(partyId, mail);
    currentStatus = -1;
    loadingDone = true;
    notifyListeners();
  }

  Future<int> getInvitationStatus(String partyId, String mail) async {
    return await InvitationsData.getInvitationStatus(partyId, mail);
  }

// int getInvitationStatus(String mail) {
//   for (var i = 0; i < partyGuests.length; i++) {
//     if (partyGuests[i].guestEmail == mail) {
//       return partyGuests[i].status;
//     }
//   }
//   return 0;
// }
}
