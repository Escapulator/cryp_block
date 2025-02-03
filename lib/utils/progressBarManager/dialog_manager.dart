import 'package:flutter/material.dart';

import '../busy_dialog.dart';
import '../locator.dart';
import 'dialog_models.dart';
import 'dialog_service.dart';

class ProgressManager extends StatefulWidget {
  final Widget child;
  const ProgressManager({super.key, required this.child});

  @override
  State<ProgressManager> createState() => _ProgressManagerState();
}

class _ProgressManagerState extends State<ProgressManager> {
  final ProgressService _progressService = locator<ProgressService>();

  @override
  void initState() {
    super.initState();
    _progressService.registerProgressListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  //
  void _showDialog(ProgressRequest request) async {
    ArsProgressDialog progressDialog = ArsProgressDialog(context,
        dismissable: false,
        //enable blur if the loading dialog will be a small part of the screen
        //presently, the loading page is full screen
        //blur: 2,
        backgroundColor: Colors.white,
        animationDuration: const Duration(milliseconds: 500),
        loadingWidget: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: CircularProgressIndicator(),
        ));

    progressDialog.show();
  }
}
