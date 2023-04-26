import 'dart:convert';
import 'package:lets_party_frontend/core/models/party_model.dart';
import 'package:http/http.dart' as http;

class PartyData {
  PartyData() {}

  String apiPath = 'http://192.168.1.100:8081/api/v1/parties';
  List<PartyModel> hostedParties = [];

  Future<List<PartyModel>> getListOfHostedParties() async {
    await Future.delayed(const Duration(seconds: 1));
    return hostedParties;
  }

  Future<List<PartyModel>> getListOfGoingParties() async {
    final response = await http.get(Uri.parse(apiPath));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => PartyModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data.');
    }
  }

  Future<PartyModel> getParty(String id) async {
    final response = await http.get(Uri.parse('$apiPath/$id'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return PartyModel.fromJson(data);
    } else {
      throw Exception('Failed to load data.');
    }
  }
}
