import 'dart:convert';
import 'package:lets_party_frontend/core/models/party_model.dart';
import 'package:http/http.dart' as http;
import 'package:lets_party_frontend/core/authentication/authenticator.dart';

class PartyData {
  PartyData();

  String apiPath = 'http://10.0.2.2:8081/api/v1/parties';
  List<PartyModel> hostedParties = [
  ];

  Map<String, String> headers = {
    'Authorization': 'Bearer ${Authenticator.token}',
    'Content-Type': 'application/json', // set the content-type header to indicate that the body is JSON
  };

  Future<List<PartyModel>> getListOfHostedParties() async {
    await Future.delayed(const Duration(seconds: 1));
    return hostedParties;
  }

  Future<List<PartyModel>> getListOfGoingParties() async {
    final response = await http.get(Uri.parse(apiPath), headers: headers);
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => PartyModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data.');
    }
  }

  Future<PartyModel> getParty(String id) async {
    final response =
        await http.get(Uri.parse('$apiPath/$id'), headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return PartyModel.fromJson(data);
    } else {
      throw Exception('Failed to load data.');
    }
  }

  Future<void> createParty(String name, String description, DateTime rsvp, DateTime when, String location, List<String> tags) async {
    Map<String, dynamic> body = {
      'name': name,
      'description': description,
      'rsvp': rsvp.toIso8601String(),
      'when': when.toIso8601String(),
      'location': location,
      'tags': tags,
      'hostEmail': Authenticator.email
    };

    final response = await http.post(Uri.parse(apiPath), headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      print('Party created.');
    } else {
      throw Exception('Failed to create party.');
    }

  }
}
