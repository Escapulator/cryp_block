import 'package:cypt_block/screens/views/auth/login.dart';
import 'package:cypt_block/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  testWidgets('Login screen UI elements exist and function correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Login()));
    expect(find.text('Email address'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
    await tester.enterText(find.byType(TextFormField).first, 'invalidemail');
    await tester.pump();
    expect(find.text('Invalid Email Provided'), findsOneWidget);
    await tester.enterText(
        find.byType(TextFormField).first, 'test@example.com');
    await tester.pump();
    await tester.enterText(find.byType(TextFormField).last, 'ValidPass123!');
    await tester.pump();
    await tester.tap(find.text('Continue'));
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsNothing);
  });
}
