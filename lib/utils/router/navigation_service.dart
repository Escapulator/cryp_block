import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  pop() {
    return _navigationKey.currentState!.pop();
  }

  popwithData(var value) {
    return _navigationKey.currentState!.pop(value);
  }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateReplacementTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateandRemoveRoute(String routeName) {
    return _navigationKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (route) => false);
  }
}
