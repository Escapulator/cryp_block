import 'package:cypt_block/core/model/blocks_model/latest_block_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LatestBlockModel', () {
    // Test for the constructor
    test('should create a LatestBlockModel with given values', () {
      final model = LatestBlockModel(
        hash: '0000000000000000000',
        ver: 1,
        prevBlock: '0000000000000000000',
        mrklRoot: 'abcdef12345',
        time: 1617556345,
        bits: 486604799,
        nonce: 123456,
        nTx: 1000,
        size: 1234567,
        blockIndex: 10,
        mainChain: true,
        height: 654321,
        receivedTime: 1617556345,
        relayedBy: 'node1',
        tx: ['tx1', 'tx2'],
      );

      expect(model.hash, '0000000000000000000');
      expect(model.ver, 1);
      expect(model.prevBlock, '0000000000000000000');
      expect(model.mrklRoot, 'abcdef12345');
      expect(model.time, 1617556345);
      expect(model.bits, 486604799);
      expect(model.nonce, 123456);
      expect(model.nTx, 1000);
      expect(model.size, 1234567);
      expect(model.blockIndex, 10);
      expect(model.mainChain, true);
      expect(model.height, 654321);
      expect(model.receivedTime, 1617556345);
      expect(model.relayedBy, 'node1');
      expect(model.tx, ['tx1', 'tx2']);
    });

    // Test for fromJson method
    test('should create a LatestBlockModel from JSON', () {
      final json = {
        'hash': '0000000000000000000',
        'ver': 1,
        'prev_block': '0000000000000000000',
        'mrkl_root': 'abcdef12345',
        'time': 1617556345,
        'bits': 486604799,
        'nonce': 123456,
        'n_tx': 1000,
        'size': 1234567,
        'block_index': 10,
        'main_chain': true,
        'height': 654321,
        'received_time': 1617556345,
        'relayed_by': 'node1',
        'tx': ['tx1', 'tx2'],
      };

      final model = LatestBlockModel.fromJson(json);

      expect(model.hash, '0000000000000000000');
      expect(model.ver, 1);
      expect(model.prevBlock, '0000000000000000000');
      expect(model.mrklRoot, 'abcdef12345');
      expect(model.time, 1617556345);
      expect(model.bits, 486604799);
      expect(model.nonce, 123456);
      expect(model.nTx, 1000);
      expect(model.size, 1234567);
      expect(model.blockIndex, 10);
      expect(model.mainChain, true);
      expect(model.height, 654321);
      expect(model.receivedTime, 1617556345);
      expect(model.relayedBy, 'node1');
      expect(model.tx, ['tx1', 'tx2']);
    });

    // Test for toJson method
    test('should convert LatestBlockModel to JSON', () {
      final model = LatestBlockModel(
        hash: '0000000000000000000',
        ver: 1,
        prevBlock: '0000000000000000000',
        mrklRoot: 'abcdef12345',
        time: 1617556345,
        bits: 486604799,
        nonce: 123456,
        nTx: 1000,
        size: 1234567,
        blockIndex: 10,
        mainChain: true,
        height: 654321,
        receivedTime: 1617556345,
        relayedBy: 'node1',
        tx: ['tx1', 'tx2'],
      );

      final json = model.toJson();

      expect(json['hash'], '0000000000000000000');
      expect(json['ver'], 1);
      expect(json['prev_block'], '0000000000000000000');
      expect(json['mrkl_root'], 'abcdef12345');
      expect(json['time'], 1617556345);
      expect(json['bits'], 486604799);
      expect(json['nonce'], 123456);
      expect(json['n_tx'], 1000);
      expect(json['size'], 1234567);
      expect(json['block_index'], 10);
      expect(json['main_chain'], true);
      expect(json['height'], 654321);
      expect(json['received_time'], 1617556345);
      expect(json['relayed_by'], 'node1');
      expect(json['tx'], ['tx1', 'tx2']);
    });
  });
}
