import 'dart:convert';

import 'package:flutter/foundation.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  String baseUrl = "http://marahabbar.pythonanywhere.com/Api/";
  // static final storage = new FlutterSecureStorage();

  Future<http.Response> get(
      {required String url, @required String? token}) async {
    url = formater(url);
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
      print('headers');
      print(headers);
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    //print('after get call');
    // print(jsonDecode(response.body)['access']);

    if (response.statusCode == 200) {
      print(response.body);
      return response;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }

  Future<http.Response> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    url = formater(url);
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> data = jsonDecode(response.body);
      //storeToken(token: data['access']!);
      return response;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }

  Future<http.Response> put(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    url = formater(url);
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    print('url = $url body = $body token = $token ');
    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      return response;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }

  String formater(String url) {
    return baseUrl + url;
  }

  // static Future<void> storeToken({required String token}) async {
  //   await storage.write(key: "token", value: token);
  // }

  // static Future<String?> readToken() async {
  //   return await storage.read(key: 'token');
  // }

  void upDateSharedPreferences(String token
      //, int id

      ) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString('token', token);
    // _prefs.setInt('id', id);
  }
}
