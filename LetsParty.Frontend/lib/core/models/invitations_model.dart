class InvitationsModel {

  InvitationsModel({required this.invitedEmail,required this.partyId,required this.status});

  String invitedEmail;
  String partyId;
  int status;

  factory InvitationsModel.fromJson(Map<String, dynamic> json) {
    return InvitationsModel(
      invitedEmail :json['invitedEmail'],
      partyId: json['partyId'],
      status: json['status'],
    );
  }

  @override
  String toString() {
    return 'InvitationsModel{invitedEmail: $invitedEmail, partyId: $partyId, status: $status}';
  }
}