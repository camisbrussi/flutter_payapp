import 'package:flutter/material.dart';
import 'package:payapp/modules/login/login_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payapp/shared/themes/images.dart';
import 'package:payapp/shared/widgets/social_login/social_login_button.dart';

main() {
  LoginPage controller;

  setUp(() {
    controller = LoginPage();
  });

  group("Login Page Test", () {
    testWidgets("Login Page - Init, Title, FAB", (tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginPage()));

      expect(find.text("Organize seus boletos em um só lugar"), findsOneWidget);
      expect(find.byType(SocialLoginButton), findsOneWidget);
    });
  });

  testWidgets("Login Page - Click FAB", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));
    await tester.pumpAndSettle(Duration(seconds: 1));
  });
}
