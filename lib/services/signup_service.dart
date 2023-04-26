import 'package:loginuicolors/helper/api.dart';
import 'package:http/http.dart' as http;

class SignupServise {
  String signupUrl = 'signup/';

  Future<http.Response> Signup(
      {required String email,
      required String password,
      required String name}) async {
    Map<String, dynamic> body = {
      "email": email,
      "password": password,
      "first_name": name,
    };

    var req = await Api().post(url: signupUrl, body: body);
    print(body['access']);

    // Api.storeToken(token: body['access']!);
    return req;
  }
}
