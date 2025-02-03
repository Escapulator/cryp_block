import 'package:cypt_block/core/model/blocks_model/block_transaction_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BlockTransactionModel', () {
    test('fromJson should correctly parse the JSON data', () {
      final json = {
        "hash": "0000000000000000000abcdef1234567890",
        "tx": [
          {
            "hash": "abcdef1234567890abcdef1234567890",
            "ver": 1,
            "vin_sz": 1,
            "vout_sz": 2,
            "size": 250,
            "weight": 1000,
            "fee": 1000,
            "relayed_by": "node1",
            "lock_time": 0,
            "tx_index": 123,
            "double_spend": false,
            "time": 1617187200,
            "block_index": 1234,
            "block_height": 6789
          }
        ]
      };

      final blockTransactionModel = BlockTransactionModel.fromJson(json);

      expect(blockTransactionModel.hash, "0000000000000000000abcdef1234567890");
      expect(blockTransactionModel.tx, isNotEmpty);
      expect(blockTransactionModel.tx!.first.hash,
          "abcdef1234567890abcdef1234567890");
      expect(blockTransactionModel.tx!.first.ver, 1);
    });

    test('toJson should correctly convert the model to JSON', () {
      final tx = Tx(
        hash: "abcdef1234567890abcdef1234567890",
        ver: 1,
        vinSz: 1,
        voutSz: 2,
        size: 250,
        weight: 1000,
        fee: 1000,
        relayedBy: "node1",
        lockTime: 0,
        txIndex: 123,
        doubleSpend: false,
        time: 1617187200,
        blockIndex: 1234,
        blockHeight: 6789,
      );

      final blockTransactionModel = BlockTransactionModel(
        hash: "0000000000000000000abcdef1234567890",
        tx: [tx],
      );

      final json = blockTransactionModel.toJson();

      expect(json['hash'], "0000000000000000000abcdef1234567890");
      expect(json['tx'], isNotEmpty);
      expect(json['tx'][0]['hash'], "abcdef1234567890abcdef1234567890");
      expect(json['tx'][0]['ver'], 1);
    });
  });

  group('Tx', () {
    test('fromJson should correctly parse the JSON data', () {
      final json = {
        "hash": "abcdef1234567890abcdef1234567890",
        "ver": 1,
        "vin_sz": 1,
        "vout_sz": 2,
        "size": 250,
        "weight": 1000,
        "fee": 1000,
        "relayed_by": "node1",
        "lock_time": 0,
        "tx_index": 123,
        "double_spend": false,
        "time": 1617187200,
        "block_index": 1234,
        "block_height": 6789
      };

      final tx = Tx.fromJson(json);

      expect(tx.hash, "abcdef1234567890abcdef1234567890");
      expect(tx.ver, 1);
      expect(tx.vinSz, 1);
      expect(tx.voutSz, 2);
      expect(tx.size, 250);
      expect(tx.weight, 1000);
      expect(tx.fee, 1000);
      expect(tx.relayedBy, "node1");
      expect(tx.lockTime, 0);
      expect(tx.txIndex, 123);
      expect(tx.doubleSpend, false);
      expect(tx.time, 1617187200);
      expect(tx.blockIndex, 1234);
      expect(tx.blockHeight, 6789);
    });

    test('toJson should correctly convert the model to JSON', () {
      final tx = Tx(
        hash: "abcdef1234567890abcdef1234567890",
        ver: 1,
        vinSz: 1,
        voutSz: 2,
        size: 250,
        weight: 1000,
        fee: 1000,
        relayedBy: "node1",
        lockTime: 0,
        txIndex: 123,
        doubleSpend: false,
        time: 1617187200,
        blockIndex: 1234,
        blockHeight: 6789,
      );

      final json = tx.toJson();

      expect(json['hash'], "abcdef1234567890abcdef1234567890");
      expect(json['ver'], 1);
      expect(json['vin_sz'], 1);
      expect(json['vout_sz'], 2);
      expect(json['size'], 250);
      expect(json['weight'], 1000);
      expect(json['fee'], 1000);
      expect(json['relayed_by'], "node1");
      expect(json['lock_time'], 0);
      expect(json['tx_index'], 123);
      expect(json['double_spend'], false);
      expect(json['time'], 1617187200);
      expect(json['block_index'], 1234);
      expect(json['block_height'], 6789);
    });
  });
}
