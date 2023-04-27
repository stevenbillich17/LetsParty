import 'dart:convert';
import 'package:lets_party_frontend/core/authentication/authenticator.dart';
import 'package:lets_party_frontend/core/models/invitations_model.dart';
import 'package:http/http.dart' as http;

class InvitationsData {
  InvitationsData();

  String apiPath = 'http://10.0.2.2:8081/api/v1/invitations';

  Map<String, String> headers = {
    "Authorization": "Bearer ${Authenticator.token}"
  };

  Future<List<InvitationsModel>> getListOfInvitationsForParty(String partyId) async {
    final response = await http.get(Uri.parse('$apiPath/party/$partyId'), headers: headers);
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => InvitationsModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data.');
    }
  }

  Future<List<InvitationsModel>> getListOfInvitationsForUser(String mail) async {
    final response = await http.get(Uri.parse('$apiPath/email/$mail'), headers: headers);
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => InvitationsModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data.');
    }
  }
}