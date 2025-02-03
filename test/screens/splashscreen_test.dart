import 'package:cypt_block/main.dart';
import 'package:cypt_block/screens/splashscreen.dart';
import 'package:cypt_block/utils/locator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setupLocator();
  testWidgets('AnimatedSplashScreen navigates after delay',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(AnimatedSplashScreen), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 3));

    expect(find.byType(AnimatedSplashScreen), findsNothing);
  });
}
