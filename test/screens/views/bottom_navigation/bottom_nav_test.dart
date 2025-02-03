import 'package:cypt_block/screens/views/bottom_navigation/bottom_nav.dart';
import 'package:cypt_block/screens/views/bottom_navigation/bottom_nav_view_model.dart';
import 'package:cypt_block/screens/views/explore/view/explore_home.dart';
import 'package:cypt_block/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  testWidgets('BottomNav displays correct tabs and changes view when tapped',
      (WidgetTester tester) async {
    final model = AppStateProvider();

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<AppStateProvider>(
          create: (_) => model,
          child: const BottomNav(),
        ),
      ),
    );

    expect(find.byType(ExploreHome), findsOneWidget);
    final bottomNavBar = find.byType(BottomNavigationBar);
    expect(bottomNavBar, findsOneWidget);
    await tester.tap(find.text('Portfolio'));
    await tester.pumpAndSettle();
    expect(find.byType(ExploreHome), findsNothing);
    expect(find.byType(Placeholder), findsOneWidget);
    await tester.tap(find.text('Earn'));
    await tester.pumpAndSettle();
    expect(find.byType(Placeholder), findsOneWidget);
    await tester.tap(find.text('Spend'));
    await tester.pumpAndSettle();
    expect(find.byType(Placeholder), findsOneWidget);
    await tester.tap(find.text('Connect'));
    await tester.pumpAndSettle();

    expect(find.byType(Placeholder), findsOneWidget);
  });
}
