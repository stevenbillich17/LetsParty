import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lets_party_frontend/app/home/widgets/page_button.dart';
import 'package:lets_party_frontend/assets/app_colors.dart';

void main() {
  group('PageButton', () {
    const svgAssetPath = 'lib/assets/images/settings.svg';
    const text = 'Button';

    testWidgets('should display the correct SVG asset',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Material(
            child: PageButton(
              onPressed: onPressed,
              svgAssetPath: svgAssetPath,
              text: text,
            ),
          ),
        ),
      );

      final svgWidgetFinder =
          find.byWidgetPredicate((widget) => widget is SvgPicture);

      expect(svgWidgetFinder, findsOneWidget);
    });

    testWidgets('should display the correct text', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Material(
            child: PageButton(
              onPressed: onPressed,
              svgAssetPath: svgAssetPath,
              text: text,
            ),
          ),
        ),
      );

      final textFinder = find.text(text);
      expect(textFinder, findsOneWidget);
    });

    testWidgets('should call onPressed callback when pressed',
        (WidgetTester tester) async {
      bool callbackCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: PageButton(
              onPressed: () {
                callbackCalled = true;
              },
              svgAssetPath: svgAssetPath,
              text: text,
            ),
          ),
        ),
      );

      final buttonFinder = find.byType(ElevatedButton);
      expect(buttonFinder, findsOneWidget);

      await tester.tap(buttonFinder);
      await tester.pumpAndSettle();

      expect(callbackCalled, isTrue);
    });

    testWidgets('should have the correct button style',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Material(
            child: PageButton(
              onPressed: onPressed,
              svgAssetPath: svgAssetPath,
              text: text,
            ),
          ),
        ),
      );

      final buttonFinder = find.byType(ElevatedButton);
      expect(buttonFinder, findsOneWidget);

      final button = tester.widget<ElevatedButton>(buttonFinder);

      expect(button.style!.shape!.resolve({}), isA<OutlinedBorder>());
      expect(button.style!.shadowColor!.resolve({}), Colors.grey);
      expect(button.style!.backgroundColor!.resolve({}), appYellow);
    });

    testWidgets('should have the correct text style',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Material(
            child: PageButton(
              onPressed: onPressed,
              svgAssetPath: svgAssetPath,
              text: text,
            ),
          ),
        ),
      );

      final textFinder = find.text(text);
      expect(textFinder, findsOneWidget);

      final textWidget = tester.widget<Text>(textFinder);
      expect(textWidget.style!.fontSize, 12.5);
    });

    testWidgets('should display the correct text', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Material(
            child: PageButton(
              onPressed: onPressed,
              svgAssetPath: svgAssetPath,
              text: text,
            ),
          ),
        ),
      );

      final textFinder = find.text(text);
      expect(textFinder, findsOneWidget);
    });
  });
}

void onPressed() {}
