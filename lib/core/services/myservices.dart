import 'dart:developer';

import 'package:flutter/material.dart';

import '../../utils/http/paths.dart';
import '../model/blocks_model/block_transaction_model.dart';
import '../model/blocks_model/latest_block_model.dart';
import '../model/response_model/error_model.dart';
import '../model/response_model/success_model.dart';
import 'base_url.dart';

class MyServices with ChangeNotifier {
  late LatestBlockModel _latestBlockModel;
  LatestBlockModel get latestBlockModel => _latestBlockModel;

  late BlockTransactionModel _blockTransactionModel;
  BlockTransactionModel get blockTransactionModel => _blockTransactionModel;

  bool hasTransactions = false;

  // late String _phoneNumber;
  // String get phoneNumber => _phoneNumber;

  Future getLatestBlock() async {
    try {
      final response = await http.get(Paths.latestblock);
      if (response is ErrorModel) {
        return ErrorModel(response.error);
      }
      if (response is SuccessModel) {
        _latestBlockModel = LatestBlockModel.fromJson(response.data);
        return SuccessModel(response.data);
      }
    } catch (e) {
      log(e.toString());
      return ErrorModel('Failed to get latest block');
    }
  }

  Future transactions(String blockHash) async {
    try {
      final response = await http.get(Paths.blockTransactions + blockHash);
      if (response is ErrorModel) {
        return ErrorModel(response.error);
      }
      if (response is SuccessModel) {
        hasTransactions = true;
        _blockTransactionModel = BlockTransactionModel.fromJson(response.data);
        return SuccessModel(response.data);
      }
    } catch (e) {
      log(e.toString());
      return ErrorModel('Failed to get transactions');
    }
  }
}
