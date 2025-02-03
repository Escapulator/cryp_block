import 'package:cypt_block/screens/views/explore/view/explore_home.dart';
import 'package:cypt_block/screens/views/explore/view_model/explore_view_model.dart';
import 'package:cypt_block/screens/widgets/assets_tile.dart';
import 'package:cypt_block/screens/widgets/coin_card.dart';
import 'package:cypt_block/screens/widgets/news_tile.dart';
import 'package:cypt_block/utils/locator.dart';
import 'package:cypt_block/utils/router/navigation_service.dart';
import 'package:cypt_block/core/services/myservices.dart';
import 'package:cypt_block/core/model/response_model/success_model.dart';
import 'package:cypt_block/utils/router/route_names.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'explore_home_test.mocks.dart';

@GenerateMocks([ExploreViewModel, MyServices, NavigationService])
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  late MockExploreViewModel mockViewModel;
  late MockMyServices mockMyServices;
  late MockNavigationService mockNavigationService;

  setUp(() {
    mockViewModel = MockExploreViewModel();
    mockMyServices = MockMyServices();
    mockNavigationService = MockNavigationService();
  });

  testWidgets(
      'Explore screen UI loads correctly and "See all" triggers transaction fetch',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ExploreViewModel>(
            create: (_) => mockViewModel,
          ),
          Provider<MyServices>(
            create: (_) => mockMyServices,
          ),
          Provider<NavigationService>(
            create: (_) => mockNavigationService,
          ),
        ],
        child: const MaterialApp(home: ExploreHome()),
      ),
    );
    expect(find.text('Explore'), findsOneWidget);
    expect(find.text('My balance'), findsOneWidget);
    expect(find.text('₦5,000.00'), findsOneWidget);
    expect(find.text('My assets'), findsOneWidget);
    expect(find.byType(AssetsTile), findsWidgets);
    expect(find.text("Today’s Top Movers"), findsOneWidget);
    expect(find.byType(CoinCard), findsWidgets);
    expect(find.text("Trending news"), findsOneWidget);
    expect(find.byType(NewsTile), findsOneWidget);
    await tester.tap(find.text('See all').first);
    await tester.pump();
    final fakeResponse = SuccessModel({"message": "Transaction Fetched"});
    when(mockMyServices.transactions(any))
        .thenAnswer((_) async => fakeResponse);
    await mockViewModel
        .getTransactionList(tester.element(find.byType(ExploreHome)));

    verify(mockNavigationService.navigateTo(transactionsRoute)).called(1);
  });
}
