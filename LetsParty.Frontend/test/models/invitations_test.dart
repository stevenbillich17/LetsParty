import 'package:flutter_test/flutter_test.dart';
import 'package:lets_party_frontend/core/models/invitations_model.dart';

void main() {
  group('Testing Invitations Model', () {
    final json = {
      'partyId': 'asd',
      'invitedEmail': 'testinv@mail.com',
      'status': 1
    };

    const String expectedString =
        'InvitationsModel{invitedEmail: testinv@mail.com, partyId: asd, status: 1}';

    test('Testing Invitations Model from String', () {
      expect(InvitationsModel.fromJson(json), isA<InvitationsModel>());
      expect(InvitationsModel.fromJson(json).toString(), expectedString);
    });
  });
}
