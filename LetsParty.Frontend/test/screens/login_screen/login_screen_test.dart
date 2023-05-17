import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lets_party_frontend/app/components/input_field_widgets.dart';
import 'package:lets_party_frontend/app/login/login_screen.dart';
import 'package:lets_party_frontend/app/signup/signup_screen.dart';
import 'package:provider/provider.dart';
import 'package:lets_party_frontend/app/login/login_bloc.dart';
import 'package:lets_party_frontend/app/home/home_screen.dart';

import 'MockLoginBlock.dart';

void main() {
  group('LoginScreen', () {
    testWidgets('should render correctly', (WidgetTester tester) async {
      final widget = MaterialApp(
        home: ChangeNotifierProvider(
          create: (context) => LoginBloc(),
          child: LoginScreen(),
        ),
      );

      await tester.pumpWidget(widget);

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('log in'), findsOneWidget);
      expect(find.byType(SignUpScreen), findsNothing);
      expect(find.byType(Form), findsOneWidget);
      expect(find.byType(InputField), findsNWidgets(2));
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('Log in'), findsOneWidget);
    });

    testWidgets('should navigate to SignUpScreen when "Sign Up" button is pressed', (WidgetTester tester) async {
      final widget = MaterialApp(
        home: ChangeNotifierProvider(
          create: (context) => LoginBloc(),
          child: LoginScreen(),
        ),
      );

      await tester.pumpWidget(widget);

      final signUpButtonFinder = find.text('Sign Up');
      expect(signUpButtonFinder, findsOneWidget);

      await tester.tap(signUpButtonFinder);
      await tester.pumpAndSettle();

      expect(find.byType(SignUpScreen), findsOneWidget);
    });

    testWidgets('should find login button', (WidgetTester tester) async {
      final loginBloc = MockLoginBloc();
      final widget = MaterialApp(
        home: ChangeNotifierProvider(
          create: (context) => loginBloc,
          child: LoginScreen(),
        ),
      );

      await tester.pumpWidget(widget);

      final loginButtonFinder = find.text('Log in');
      expect(loginButtonFinder, findsOneWidget);
    });

  });
}
