import 'package:flutter/cupertino.dart';
import 'package:lets_party_frontend/core/models/party_model.dart';
import 'package:lets_party_frontend/core/repository/image_data.dart';
import 'package:lets_party_frontend/core/repository/party_data.dart';

import '../../core/authentication/authenticator.dart';

class HomeScreenBloc extends ChangeNotifier {
  HomeScreenBloc() {
    loadScreen();
  }

  List<PartyModel> goingParties = [];
  List<PartyModel> hostedParties = [];
  Map<String, Image> images = {};
  bool isLoadingDone = false;
  final PartyData _partyData = PartyData();
  final ImageData _imageData = ImageData();

  Future<void> loadScreen() async {
    print(Authenticator.token);
    goingParties = await _partyData.getListOfGoingParties();
    hostedParties = await _partyData.getListOfHostedParties();

    for (PartyModel party in goingParties + hostedParties) {
      if (party.imageId != '') {
        print(party.imageId);
        images[party.id] = await _imageData.getImageById(party.imageId);
      }
    }

    isLoadingDone = true;
    notifyListeners();
  }
}
