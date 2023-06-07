import 'dart:convert';
import 'package:lets_party_frontend/core/authentication/authenticator.dart';
import 'package:lets_party_frontend/core/models/invitations_model.dart';
import 'package:http/http.dart' as http;
import 'package:lets_party_frontend/core/models/user_model.dart';

class InvitationsData {
  InvitationsData();

  static String _apiPath = 'http://10.0.2.2:8081/api/v1/invitations';

  static Map<String, String> _headers = {
    "Authorization": "Bearer ${Authenticator.token}"
  };

  Future<List<InvitationsModel>> getListOfInvitationsForParty(String partyId) async {
    final response = await http.get(Uri.parse('$_apiPath/party/$partyId'), headers: _headers);
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => InvitationsModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data.');
    }
  }

  Future<List<InvitationsModel>> getListOfInvitationsForUser(String mail) async {
    final response = await http.get(Uri.parse('$_apiPath/invited/$mail'), headers: _headers);
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => InvitationsModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data.');
    }
  }

  Future<List<UserModel>> getListOfFriend() async {
    final response = await http.get(Uri.parse('$_apiPath/friends'), headers: _headers);
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data.');
    }
  }

  static void acceptInvitation(String partyId, String mail) async {
    await http.post(Uri.parse('$_apiPath/accept/$partyId/$mail'), headers: _headers);
  }

  static void declineInvitation(String partyId, String mail) async {
    await http.post(Uri.parse('$_apiPath/decline/$partyId/$mail'), headers: _headers);
  }

  static Future<int> getInvitationStatus(String partyId, String mail) async {
     final response = await http.get(Uri.parse('$_apiPath/status/$partyId/$mail'), headers: _headers);
     print(response.body);
      if(response.statusCode == 200) {
        return int.parse(response.body.trim());
      }
      else {
       throw Exception('Failed to load data. ${response.statusCode}');
      }
      // return int.parse(response.body.trim());
      return 0;
  }
}