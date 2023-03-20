class PartyModel {
  PartyModel({
    required this.description,
    required this.name,
    required this.pictureLink,
    required this.hostEmail,
    required this.rsvp,
    required this.when,
    required this.where,
    required this.tags,
    required this.id,
  });

  String description;
  String name;
  String pictureLink;
  String hostEmail;
  DateTime rsvp;
  DateTime when;
  String where;
  String id;
  List<String> tags;
}
