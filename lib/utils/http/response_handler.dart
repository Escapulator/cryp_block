import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../core/model/response_model/error_model.dart';
import '../../core/model/response_model/success_model.dart';

handleResponse(http.Response response) {
  try {
    kDebugMode
        ? log(
            'ResponseCode:: ${response.statusCode},   ResponseBody:: ${response.body}')
        : null;

    final int code = response.statusCode;
    final dynamic body = json.decode(response.body);
    if (code == 200 || code == 201) {
      return SuccessModel(body);
    }
    return ErrorModel(body['message']);
  } catch (ex) {
    log(ex.toString());
    return ErrorModel('Request failed');
  }
}
