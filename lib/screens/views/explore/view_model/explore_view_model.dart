import 'package:cypt_block/core/model/response_model/error_model.dart';
import 'package:cypt_block/core/model/response_model/success_model.dart';
import 'package:cypt_block/core/services/myservices.dart';
import 'package:cypt_block/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/base_model.dart';
import '../../../../utils/locator.dart';
import '../../../../utils/router/navigation_service.dart';
import '../../../../utils/router/route_names.dart';

class ExploreViewModel extends BaseModel {
  final NavigationService navigationService = locator<NavigationService>();

  getTransactionList(BuildContext context) async {
    setBusy(true);
    final dataProvider = context.read<MyServices>();
    final result =
        await dataProvider.transactions(dataProvider.latestBlockModel.hash!);
    if (result is ErrorModel) {
      setBusy(false);
      showErrorToast(result.error);
      return ErrorModel(result.error);
    }
    if (result is SuccessModel) {
      setBusy(false);
      showToast('Transaction Fetched');
      navigationService.navigateTo(transactionsRoute);
      return SuccessModel(result.data);
    }
  }
}
