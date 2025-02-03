import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/model/response_model/error_model.dart';
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
    final response = await context.read<MyServices>().getLatestBlock();
    if (response is ErrorModel) {
      setBusy(false);
      showErrorToast('Invalid Email or Password Provided');
      return ErrorModel(response.error);
    }
    if (response is SuccessModel) {
      setBusy(false);
      showToast('Login Successful');
      _navigationService.navigateandRemoveRoute(dashboardRoute);
      return SuccessModel(response.data);
    }
    // setBusy(true);
    // final result = _MyServices.login(loginPayload.toJson());
    // if (result is ErrorModel) {
    //   setBusy(false);
    //   showErrorToast(result.error);
    //   return ErrorModel(result.error);
    // }
    // if (result is SuccessModel) {
    //   setBusy(false);
    //   showToast(result.data['message']);
    //   _navigationService.navigateandRemoveRoute(dashboardRoute);
    //   return SuccessModel(result.data);
    // }
  }
}
