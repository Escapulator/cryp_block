import 'package:cypt_block/core/model/blocks_model/block_transaction_model.dart';
import 'package:cypt_block/screens/views/explore/view/transactions.dart';
import 'package:cypt_block/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:cypt_block/core/services/myservices.dart';

class MockMyServices extends Mock implements MyServices {}

void main() {
  group('description', () {
    testWidgets('Transactions widget displays transaction data correctly',
        (WidgetTester tester) async {
      final mockMyServices = MockMyServices();
      final mockBlockTransactionModel = BlockTransactionModel(
          hash:
              '0000000000000bae09a7a393a8acded75aa67e46cb81f7acaa5ad94f9eacd103',
          tx: [
            Tx(
              hash: '0000000000000bae09a7a39',
              time: 1617187200,
            )
          ]);
      when(mockMyServices.blockTransactionModel)
          .thenReturn(mockBlockTransactionModel);

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<MyServices>.value(
            value: mockMyServices,
            child: Transactions(),
          ),
        ),
      );

      expect(find.text('0000000000000bae09a7a39'), findsOneWidget);
      expect(find.text(formatTimestamp(1617187200)), findsOneWidget);
    });
  });

  group(('description'), () {
    testWidgets(
        'Integration test: Transactions widget loads and navigates on tap',
        (WidgetTester tester) async {
      final mockMyServices = MockMyServices();
      final mockBlockTransactionModel = BlockTransactionModel(
          hash:
              '0000000000000bae09a7a393a8acded75aa67e46cb81f7acaa5ad94f9eacd103',
          tx: [
            Tx(
              hash: '0000000000000bae09a7a39',
              time: 1617187200,
            )
          ]);

      when(mockMyServices.blockTransactionModel)
          .thenReturn(mockBlockTransactionModel);

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<MyServices>.value(
            value: mockMyServices,
            child: Transactions(),
          ),
        ),
      );

      expect(find.text('0000000000000bae09a7a39'), findsOneWidget);
      expect(find.text(formatTimestamp(1617187200)), findsOneWidget);

      await tester.tap(find.byType(InkResponse));
      await tester.pumpAndSettle();

      verify(mockMyServices.blockTransactionModel).called(1);
    });
  });
}
