import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

customYMargin(double value) {
  return SizedBox(height: value);
}

customXMargin(double value) {
  return SizedBox(width: value);
}

showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      webPosition: "center",
      timeInSecForIosWeb: 5,
      //backgroundColor: AppColors.green,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}

showErrorToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      webPosition: "center",
      webBgColor: "#e74c3c",
      timeInSecForIosWeb: 5,
      // backgroundColor: AppColors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

String capitalize(val) {
  return "${val[0].toUpperCase()}${val.substring(1)}";
}

formatDate(value) {
  final df = DateFormat('dd-MM-yyyy');
  return df.format(DateTime.parse(value));
}

formatDateTime(value) {
  final df = DateFormat('d MMMM, y hh:mm a');
  return df.format(DateTime.parse(value));
}

String formatTimestamp(int milliseconds) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds * 1000);
  String formattedDate = DateFormat('yyyy-MM-dd • HH:mm').format(dateTime);
  return formattedDate;
}

class Status {
  static const sent = 'sent';
  static const delivered = 'delivered';
  static const read = 'read';
}

class Validators {
  String? isEmpty(value) {
    if (value.isEmpty) {
      return 'Empty field';
    } else {
      return null;
    }
  }

  String? isPassword(value) {
    if (value.isEmpty) {
      return 'Empty field';
    } else if (validateStructure(value)) {
      return null;
    } else {
      return 'Password should contain At least one upper case letter.\nPassword should contain At least one numeric value.\nPassword should contain At least one special case characters';
    }
  }

  String? Function(String?)? comparePasswords(
      String? password1, String? password2) {
    return (String? value) {
      if (password1 == null ||
          password1.isEmpty ||
          password2 == null ||
          password2.isEmpty) {
        // If either password is null or empty, return an error message
        return "Passwords cannot be null or empty";
      } else if (password1 != password2) {
        // If the passwords don't match, return an error message
        return "Passwords do not match";
      } else {
        // If the passwords match, return null
        return null;
      }
    };
  }

  String? isEmail(value) {
    if (value.isEmpty) {
      return 'Empty field';
    } else if (validateEmail(value)) {
      return null;
    } else {
      return 'Invalid email';
    }
  }

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\_$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool validateEmail(String value) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
  }
}
