import 'package:flutter_test/flutter_test.dart';
import 'package:lets_party_frontend/core/models/item_model.dart';

void main() {
  group('ItemModel', () {
    test('should initialize with the correct values', () {
      const imageLink = 'https://example.com/item.jpg';
      const name = 'Sample Item';
      const price = 9.99;

      final item = ItemModel(imageLink, name, price);

      expect(item.imageLink, imageLink);
      expect(item.name, name);
      expect(item.price, price);
    });
  });
}
