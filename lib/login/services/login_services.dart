import 'dart:async';
import 'dart:io';

import 'package:flutter_admob_theme/login/models/model_login.dart';
import 'package:flutter_admob_theme/utilities/rest_api_utils.dart';
import 'package:http/http.dart' as http;

class LoginServices {
  static var time_out = const Duration(seconds: 10);
  static var client = http.Client();

  static Future<ModelLogin> LoginFunction(
      String phone_number, String fcm, String auth_token_id) async {
    try {
      Map<String, String> _body = {
        'phone_number': phone_number,
        'fcm': fcm,
        'auth_token_id': auth_token_id
      };

      var response = await client
          .post(Uri.parse(RestApiUtils.login), body: _body)
          .timeout(time_out);

      RestApiUtils.GetPrintHeaderBody(
          RestApiUtils.login, null, _body, response);

      if (response.statusCode == 200) {
        final modelLogin = modelLoginFromJson(response.body);

        if (modelLogin.status == 200) {
          return modelLogin;
        } else {
          return ModelLogin(
              status: modelLogin.status,
              message: RestApiUtils.GetResponse(modelLogin.status));
        }
      } else {
        return ModelLogin(
            status: response.statusCode,
            message: RestApiUtils.GetResponse(response.statusCode));
      }
    } on TimeoutException catch (_) {
      return ModelLogin(status: 408, message: RestApiUtils.GetResponse(408));
    } on SocketException {
      return ModelLogin(status: 501, message: RestApiUtils.GetResponse(501));
    } catch (ex) {
      return ModelLogin(status: 510, message: ex.toString());
    }
  }
}
