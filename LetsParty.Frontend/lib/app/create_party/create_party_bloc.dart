import 'package:flutter/material.dart';

import 'package:lets_party_frontend/core/models/party_model.dart';
import 'package:lets_party_frontend/core/models/user_model.dart';

class CreatePartyBloc extends ChangeNotifier {

  CreatePartyBloc() {
    _tags = "";
    _rsvp = DateTime.now();
    _when = DateTime.now();
  }

  PartyModel? _partyModel;
  Map<String, int> _whatIsNeeded = Map();
  List<UserModel> _invitedPeople = [];
  String? _description;
  String? _name;
  String? _imageFile;
  String? _pictureLink;
  String? _hostEmail;
  DateTime? _rsvp;
  DateTime? _when;
  String? _where;
  String? _id;
  String? _tags;

  static String getDateFormatted(DateTime date) =>
      '${date.year.toString()}-${date.month.toString()}-${date.day.toString()}';

  Future<void> pickDate(BuildContext context) async {
    DateTime? date;
    date = await showDatePicker(
      context: context,
      initialDate: DateTime.utc(DateTime.now().year),
      firstDate: DateTime.utc(DateTime.now().year),
      lastDate: DateTime.utc(DateTime.now().year + 2),
    );
    if(date != null) {
      _when = date;
    }
    notifyListeners();
  }

  Future<void> pickRsvpDate(BuildContext context) async {
    DateTime? date;
    date = await showDatePicker(
      context: context,
      initialDate: DateTime.utc(DateTime.now().year),
      firstDate: DateTime.utc(DateTime.now().year),
      lastDate: DateTime.utc(DateTime.now().year + 2),
    );
    if(date != null) {
      _rsvp = date;
    }
    notifyListeners();
  }


  void addNewPeople(UserModel user) {
    _invitedPeople ??= [];
    _invitedPeople.add(user);
  }

  void removePeople(UserModel user) {
    _invitedPeople.remove(user);
   }

  set description(String? value) {
    _description = value;
    notifyListeners();
  }

  set name(String? value) {
    _name = value;
    notifyListeners();
  }

  set imageFile(String? value) {
    _imageFile = value;
    notifyListeners();
  }


  set pictureLink(String? value) {
    _pictureLink = value;
    notifyListeners();
  }

  set hostEmail(String? value) {
    _hostEmail = value;
    notifyListeners();
  }

  set rsvp(DateTime? value) {
    _rsvp = value;
    notifyListeners();
  }

  set when(DateTime? value) {
    _when = value;
    notifyListeners();
  }


  DateTime? get when => _when;
  DateTime? get rsvp => _rsvp;


  set where(String? value) {
    _where = value;
    notifyListeners();
  }

  set id(String? value) {
    _id = value;
    notifyListeners();
  }

  set tags(String? value) {
    _tags = value ?? '';
    notifyListeners();
  }

}