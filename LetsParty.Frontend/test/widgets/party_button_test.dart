import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lets_party_frontend/app/home/widgets/party_button.dart';

void main() {
  group('PartyButton', () {
    testWidgets('should render correctly', (WidgetTester tester) async {
      final widget = MaterialApp(
        home: Material(
          child: PartyButton(
            image: 'https://example.com/image.jpg',
            name: 'Party Name',
            onPressed: () {},
          ),
        ),
      );

      await tester.pumpWidget(widget);

      final imageFinder = find.byType(Image);
      expect(imageFinder, findsOneWidget);

      final textFinder = find.text('Party Name');
      expect(textFinder, findsOneWidget);
    });

    testWidgets('should call onPressed callback when tapped', (WidgetTester tester) async {
      bool pressed = false;
      final widget = MaterialApp(
        home: Material(
          child: PartyButton(
            image: 'https://example.com/image.jpg',
            name: 'Party Name',
            onPressed: () {
              pressed = true;
            },
          ),
        ),
      );

      await tester.pumpWidget(widget);

      final buttonFinder = find.byType(RawMaterialButton);
      expect(buttonFinder, findsOneWidget);

      await tester.tap(buttonFinder);

      expect(pressed, true);
    });

    testWidgets('should show alternative color when image fails to load', (WidgetTester tester) async {
      final widget = MaterialApp(
        home: Material(
          child: PartyButton(
            image: 'invalid_image_url',
            name: 'Party Name',
            onPressed: () {},
          ),
        ),
      );

      await tester.pumpWidget(widget);

      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);
    });

    testWidgets('should have correct text style', (WidgetTester tester) async {
      final widget = MaterialApp(
        home: Material(
          child: PartyButton(
            image: 'https://example.com/image.jpg',
            name: 'Party Name',
            onPressed: () {},
          ),
        ),
      );

      await tester.pumpWidget(widget);

      final textFinder = find.text('Party Name');
      final textWidget = tester.widget<Text>(textFinder);
      expect(textWidget.style!.fontSize, 15.0);
    });
  });
}
