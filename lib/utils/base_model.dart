import 'package:flutter/widgets.dart';

import 'locator.dart';
import 'progressBarManager/dialog_models.dart';
import 'progressBarManager/dialog_service.dart';

class BaseModel extends ChangeNotifier {
  //final MyServices _MyServicesService = locator<MyServices>();
  final ProgressService _dialogService = locator<ProgressService>();
  late ProgressResponse hh;
  // Data get currentUser => _MyServicesService.currentUser;

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
    if (value == true) {
      _dialogService.showDialog(description: '', title: '');
    } else {
      _dialogService.dialogComplete();
    }
  }
}
