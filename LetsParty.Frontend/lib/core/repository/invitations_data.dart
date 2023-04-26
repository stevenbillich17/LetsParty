import 'dart:convert';
import 'package:lets_party_frontend/core/models/invitations_model.dart';
import 'package:http/http.dart' as http;

class InvitationsData {
  InvitationsData() {}

  String apiPath = 'http://192.168.1.100:8081/api/v1/invitations';

  Future<List<InvitationsModel>> getListOfInvitationsForParty(String partyId) async {
    final response = await http.get(Uri.parse('$apiPath/party/$partyId'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => InvitationsModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data.');
    }
  }

  Future<List<InvitationsModel>> getListOfInvitationsForUser(String mail) async {
    final response = await http.get(Uri.parse('$apiPath/email/$mail'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => InvitationsModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data.');
    }
  }
}