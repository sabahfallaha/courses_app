import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loginuicolors/helper/api.dart';

class LoginServise {
  String loginUrl = 'login/';

  Future<http.Response> Login(
      {required String username, required String password}) async {
    Map<String, dynamic> body = {
      "email": username,
      "password": password,
    };

    var req = await Api().post(url: loginUrl, body: body);
    print(body['access']);

    //Api.storeToken(token: body['access']);
    return req;
  }
}
