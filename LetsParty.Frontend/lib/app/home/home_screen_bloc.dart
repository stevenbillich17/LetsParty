import 'package:flutter/cupertino.dart';
import 'package:lets_party_frontend/core/models/party_model.dart';
import 'package:lets_party_frontend/core/repository/party_data.dart';

class HomeScreenBloc extends ChangeNotifier {
  HomeScreenBloc() {
    loadScreen();
  }

  List<PartyModel> goingParties = [];
  List<PartyModel> hostedParties = [];
  final PartyData _partyData = PartyData();

  Future<void> loadScreen() async {
    goingParties = (await _partyData.getListOfGoingParties()).sublist(3);
    hostedParties = goingParties.sublist(0,2);
    notifyListeners();
  }
}
