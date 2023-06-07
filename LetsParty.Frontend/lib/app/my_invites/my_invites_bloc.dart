import 'package:flutter/material.dart';
import 'package:lets_party_frontend/core/authentication/authenticator.dart';
import 'package:lets_party_frontend/core/models/invitations_model.dart';
import 'package:lets_party_frontend/core/repository/invitations_data.dart';
import 'package:lets_party_frontend/core/repository/party_data.dart';
import 'package:lets_party_frontend/core/models/party_model.dart';

import 'package:lets_party_frontend/core/repository/image_data.dart';

class MyInvitesBloc extends ChangeNotifier {
  MyInvitesBloc() {
    loadScreen();
  }

  final InvitationsData _invitationsData = InvitationsData();
  final PartyData _partyData = PartyData();
  bool isLoadingDone = false;
  List<InvitationsModel> invitations = [];
  List<PartyModel> invitedParties = [];
  Map<String, Image> images = {};
  final ImageData _imageData = ImageData();

  Future<void> loadScreen() async {
    invitations =
        await _invitationsData.getListOfInvitationsForUser(Authenticator.email);

    invitations.removeWhere((element) => element.status != 0);

    for (int i = 0; i < invitations.length; i++) {
      invitedParties.add(await _partyData.getParty(invitations[i].partyId));
    }

    for (PartyModel party in invitedParties) {
      if (party.imageId != '') {
        print(party.imageId);
        images[party.id] = await _imageData.getImageById(party.imageId);
      }
    }

    isLoadingDone = true;
    notifyListeners();
  }
}
