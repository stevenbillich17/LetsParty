import 'package:flutter_test/flutter_test.dart';
import 'package:lets_party_frontend/core/models/user_model.dart';

void main() {
  group('UserModel', () {
    test('fromJson should populate all fields correctly', () {
      final json = {
        'name': 'John Doe',
        'email': 'johndoe@example.com',
        'birthday': '1990-01-01',
      };

      final userModel = UserModel.fromJson(json);

      expect(userModel.name, 'John Doe');
      expect(userModel.email, 'johndoe@example.com');
      expect(userModel.birthday, '1990-01-01');
    });

    test('fromJson should populate only required fields if not provided', () {
      final json = {
        'name': 'John Doe',
      };

      final userModel = UserModel.fromJson(json);

      expect(userModel.name, 'John Doe');
      expect(userModel.email, isNull);
      expect(userModel.birthday, isNull);
    });

    test('fromJson should have a null name if the field is empty', () {
      final json = {
        'email': 'johndoe@example.com',
        'birthday': '1990-01-01',
      };

      final userModel = UserModel.fromJson(json);

      expect(userModel.name, isNull);
    });
  });
}
