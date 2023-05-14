import 'package:flutter/material.dart';
import 'package:lets_party_frontend/core/models/party_model.dart';

import 'package:lets_party_frontend/core/repository/party_data.dart';

class CreatePartyBloc extends ChangeNotifier {
  CreatePartyBloc() {
    tags = '';
    rsvp = DateTime.now();
    when = DateTime.now();
  }

  PartyModel? partyModel;
  String? description;
  String? name;
  String? imageFile;
  // String? pictureLink;
  String? hostEmail;
  DateTime? rsvp;
  DateTime? when;
  String? where;
  String? tags;

  final PartyData _partyData = PartyData();

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
    if (date != null) {
      when = date;
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
    if (date != null) {
      rsvp = date;
    }
    notifyListeners();
  }

  Future<void> createParty() async {
    if (rsvp != null && when != null) {
      _partyData.createParty(
        name ?? 'SPER CA MERGE',
        description ?? 'No description',
        rsvp!,
        when!,
        where ?? 'No location',
        tags != '' ? tags!.split(',') : [],
      );
    }
  }
}
