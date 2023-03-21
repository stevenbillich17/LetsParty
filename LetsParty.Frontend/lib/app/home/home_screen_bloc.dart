import 'package:flutter/cupertino.dart';
import 'package:lets_party_frontend/core/models/party_model.dart';

class HomeScreenBloc extends ChangeNotifier {
  HomeScreenBloc() {
    loadScreen();
  }

  List<PartyModel> goingParties = [];
  List<PartyModel> hostedParties = [];

  Future<void> getListOfParties() async {
    await Future.delayed(const Duration(seconds: 2));
    hostedParties.add(
      PartyModel(
        description: 'Party 1 description',
        name: 'Party 1 name',
        pictureLink:
            'https://i.pinimg.com/564x/43/9e/69/439e69f59e8dc522f6a9124e956a3f39.jpg',
        hostEmail: '',
        rsvp: DateTime(2023),
        when: DateTime(2023),
        where: 'My home',
        tags: ['drinking'],
        id: 'agfkabvkbvlsjrhw',
      ),
    );
    hostedParties.add(
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
        id: 'agfkabvkbvlsjrhw',
      ),
    );
    goingParties.add(
      PartyModel(
        description: 'Party 2 description',
        name: 'Party 2 name',
        pictureLink: '',
        hostEmail: '',
        rsvp: DateTime(2023),
        when: DateTime(2023),
        where: 'Your home',
        tags: ['drinking'],
        id: 'slngkaagbkjhaaijf',
      ),
    );
    goingParties.add(
      PartyModel(
        description: 'Party 2 description',
        name: 'Party 2 name',
        pictureLink:
            'https://i.pinimg.com/564x/d5/e2/5c/d5e25c356923ae51e5eef2e682e3860f.jpg',
        hostEmail: '',
        rsvp: DateTime(2023),
        when: DateTime(2023),
        where: 'Your home',
        tags: ['drinking'],
        id: 'slngkaagbkjhaaijf',
      ),
    );
  }

  Future<void> loadScreen() async {
    await getListOfParties();
    notifyListeners();
  }
}
