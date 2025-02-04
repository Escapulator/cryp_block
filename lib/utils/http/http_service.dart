import 'dart:convert';
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../tiny_db.dart';
import 'response_handler.dart';

class HttpService {
  final String _baseUrl;

  HttpService(this._baseUrl);
  String get baseUrl => _baseUrl;

  //get requests without token
  Future<dynamic> get(String path, [String tezosbaseUrl = '']) async {
    String baseURI = tezosbaseUrl.isEmpty ? _baseUrl : tezosbaseUrl;
    final String url = baseURI + path;
    log('Request::URL: $url');
    final response =
        await http.get(Uri.parse(url)).timeout(const Duration(seconds: 45));
    return handleResponse(response);
  }

  //get request with token and timeout
  Future<dynamic> get2(String path) async {
    final String url = baseUrl + path;
    log('Request::URL: $url');
    final response = await http
        .get(Uri.parse(url), headers: await getHeaders())
        .timeout(const Duration(seconds: 45));
    return handleResponse(response);
  }

  //get request with token, but no timeout
  Future<dynamic> get3(String path) async {
    final String url = baseUrl + path;
    log('Request::URL: $url');
    final response =
        await http.get(Uri.parse(url), headers: await getHeaders());
    return handleResponse(response);
  }

  //optional value of seconds can be passed as argument,
  //to increase, or decrease timeout
  Future<dynamic> post(String path, Map<dynamic, dynamic> body,
      [int seconds = 45]) async {
    final String url = baseUrl + path;
    log('URL:: $url, body:: ${json.encode(body)}');
    final response = await http
        .post(Uri.parse(url),
            headers: await getHeaders(), body: json.encode(body))
        .timeout(Duration(seconds: seconds));
    return handleResponse(response);
  }

  //post request with a list of maps
  Future<dynamic> post4(
    String path,
    List<Map<dynamic, dynamic>> body,
  ) async {
    final String url = baseUrl + path;
    log('URL:: $url, body:: ${json.encode(body)}');
    final response = await http
        .post(Uri.parse(url),
            headers: await getHeaders(), body: json.encode(body))
        .timeout(const Duration(seconds: 45));
    return handleResponse(response);
  }

  //post request with const timer, and no body
  Future<dynamic> post2(
    String path,
  ) async {
    final String url = baseUrl + path;
    log('URL:: $url');
    final response = await http
        .post(Uri.parse(url), headers: await getHeaders())
        .timeout(const Duration(seconds: 45));
    return handleResponse(response);
  }

  Future<dynamic> patch(String path, Map<dynamic, dynamic> body) async {
    final String url = _baseUrl + path;
    log('URL:: $url, body:: ${json.encode(body)}');
    final response = await http
        .patch(Uri.parse(url),
            headers: await getHeaders(), body: json.encode(body))
        .timeout(const Duration(seconds: 45));
    return handleResponse(response);
  }

  Future<dynamic> put(String path, Map<dynamic, dynamic> body) async {
    final String url = _baseUrl + path;
    log('URL:: $url, body:: ${json.encode(body)}');
    final response = await http
        .put(Uri.parse(url),
            headers: await getHeaders(), body: json.encode(body))
        .timeout(const Duration(seconds: 45));
    return handleResponse(response);
  }

  Future<dynamic> delete(String path) async {
    final String url = _baseUrl + path;
    log('URL:: $url body:: $path');
    final response = await http
        .delete(
          Uri.parse(url),
          headers: await getHeaders(),
        )
        .timeout(const Duration(seconds: 45));
    return handleResponse(response);
  }

  Future<dynamic> uploadData(
    String path,
    String method,
    Map<String, File> file,
    Map<String, dynamic> body,
  ) async {
    final String url = _baseUrl + path;
    log('URL:: $url, body:: ${json.encode(body)}');
    final response = http.MultipartRequest(method, Uri.parse(url));
    response.headers.addAll(await getHeaders());
    file.forEach((key, value) async {
      response.files.add(await http.MultipartFile.fromPath(
        key,
        value.path,
      ));
    });
    body.forEach((key, value) {
      response.fields[key] = value;
    });
    final multipartRequest = http.Response.fromStream(await response.send());
    log('REQUEST -- $url -- MULTIPART FILE $file');
    final result = await multipartRequest.timeout(const Duration(seconds: 60),
        onTimeout: () => throw TimeoutException(
            'Please check your internet connection and try again'));
    return handleResponse(result);
  }

  getHeaders() async {
    Object? accessToken = TinyDb.getString('token');
    // log('token $accessToken');
    return <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer $accessToken"
    };
  }
}
