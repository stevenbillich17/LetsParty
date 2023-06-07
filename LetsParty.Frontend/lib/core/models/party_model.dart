class PartyModel {
  factory PartyModel.fromJson(Map<String, dynamic> json) {
    return PartyModel(
      name: json['name'],
      description: json['description'],
      imageId: json['image'] ?? '',
      hostEmail: json['hostEmail'] ?? '',
      rsvp: DateTime.parse(json['rsvp']),
      when: DateTime.parse(json['when']),
      where: json['location'] ?? '',
      tags: List.castFrom(json['tags']),
      id: json['id'],

    );
  }

  PartyModel({
    required this.description,
    required this.name,
    required this.imageId,
    required this.hostEmail,
    required this.rsvp,
    required this.when,
    required this.where,
    required this.tags,
    required this.id,
  });

  String description;
  String name;
  String imageId;
  String hostEmail;
  DateTime rsvp;
  DateTime when;
  String where;
  String id;
  List<String> tags;

  @override
  String toString() {
    return 'PartyModel{description: $description, name: $name, pictureLink: $imageId, hostEmail: $hostEmail, rsvp: $rsvp, when: $when, where: $where, id: $id, tags: $tags}';
  }
}
