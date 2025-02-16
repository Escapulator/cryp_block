import 'dart:io';

import 'package:cypt_block/screens/views/explore/view/transactions.dart';
import 'package:cypt_block/utils/router/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens/views/auth/login.dart';
import '../../screens/views/bottom_navigation/bottom_nav.dart';
import '../../screens/views/explore/view/transaction_details.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case onboardingRoute:
    //   return _getPageRoute(
    //     routeName: settings.name!,
    //     viewToShow: const Onboarding(),
    //   );
    case loginRoute:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const Login(),
      );
    case dashboardRoute:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const BottomNav(),
      );
    case transactionsRoute:
      bool data = settings.arguments as bool;
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: Transactions(loadBitcoin: data),
      );
    case transactionDetailsRoute:
      List data = settings.arguments as List;
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: TransactionDetails(
          isBitcoin: data[0],
          tx: data[1],
          block: data[2],
        ),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute(
    {required String routeName, required Widget viewToShow}) {
  return Platform.isIOS
      ? CupertinoPageRoute(
          settings: RouteSettings(
            name: routeName,
          ),
          builder: (_) => viewToShow)
      : MaterialPageRoute(
          settings: RouteSettings(
            name: routeName,
          ),
          builder: (_) => viewToShow);
}
