import 'package:lets_party_frontend/core/models/party_model.dart';

class PartyData {
  PartyData() {
    goingParties = [
      PartyModel(
        description: 'Party 2 description',
        name: 'Party 2 name',
        pictureLink: '',
        hostEmail: '',
        rsvp: DateTime(2023),
        when: DateTime(2023),
        where: 'Your home',
        tags: ['drinking'],
        id: 'argnonijanwo',
      ),
      PartyModel(
        description: 'Party 2 description',
        name: 'Party 2 wow',
        pictureLink:
            'http://i.pinimg.com/564x/d5/e2/5c/d5e25c356923ae51e5eef2e682e3860f.jpg',
        hostEmail: 'diana@mail.com',
        rsvp: DateTime(2023),
        when: DateTime(2023),
        where: 'Your home',
        tags: ['drinking'],
        id: 'slngkaagbkjhaaijf',
      ),
    ];
    hostedParties = [
      PartyModel(
        description: 'Party 1 description',
        name: 'Party 1 name',
        pictureLink:
            'http://i.pinimg.com/564x/43/9e/69/439e69f59e8dc522f6a9124e956a3f39.jpg',
        hostEmail: '',
        rsvp: DateTime(2023),
        when: DateTime(2023),
        where: 'My home',
        tags: ['drinking'],
        id: 'agfkabvkbvlsjrhw',
      ),
      PartyModel(
        description: 'Party 1 description',
        name: 'Party 1 name',
        pictureLink:
            'https://i.pinimg.com/564x/22/8b/5b/228b5b38c6b23ab1aaf7f0788e2c62af.jpg',
        hostEmail: '',
        rsvp: DateTime(2023),
        when: DateTime(2023),
        where: 'My home',
        tags: ['drinking'],
        id: 'tsjsdrjysrjae',
      ),
    ];
  }

  List<PartyModel> goingParties = [];
  List<PartyModel> hostedParties = [];

  Future<List<PartyModel>> getListOfHostedParties() async {
    await Future.delayed(const Duration(seconds: 1));
    return hostedParties;
  }

  Future<List<PartyModel>> getListOfGoingParties() async {
    await Future.delayed(const Duration(seconds: 1));
    return goingParties;
  }

  Future<PartyModel> getParty(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    List<PartyModel> parties = goingParties + hostedParties;
    return parties.where((element) => element.id == id).toList()[0];
  }
}
