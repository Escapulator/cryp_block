import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/model/response_model/success_model.dart';
import '../../../core/services/myservices.dart';
import '../../../utils/base_model.dart';
import '../../../utils/helpers.dart';
import '../../../utils/locator.dart';
import '../../../utils/router/navigation_service.dart';
import '../../../utils/router/route_names.dart';

class AuthViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  bool validEmail = false;
  bool password = false;
  bool isValidated = false;

  void validator() {
    validEmail = emailController.text.isNotEmpty &&
        Validators().validateEmail(emailController.text);
    password = passwordController.text.isNotEmpty &&
        Validators().validateStructure(passwordController.text);
    isValidated = validEmail && password;
    notifyListeners();
  }

  login(BuildContext context) async {
    setBusy(true);
    final response = await Future.wait([
      context.read<MyServices>().getLatestBlock(),
      context.read<MyServices>().getTezosBlock()
    ]);

    bool bitcoinSuccess = response[0] is SuccessModel;
    bool tezosSuccess = response[1] is SuccessModel;

    setBusy(false);

    if (bitcoinSuccess && tezosSuccess) {
      showToast('Login Successful');
      _navigationService.navigateandRemoveRoute(dashboardRoute);
    } else {
      showErrorToast('Invalid Email or Password Provided');
    }
  }
}
