import 'dart:async';
import 'dart:io';

import 'package:flutter_admob_theme/dashboard/models/model_message.dart';
import 'package:flutter_admob_theme/utilities/rest_api_utils.dart';
import 'package:http/http.dart' as http;

class SideService {
  static final time_out = const Duration(seconds: 10);
  static final client = http.Client();

  static Future<ModelMessage> LogoutFunction(String bearer) async {
    try {
      Map<String, String> _header = {'Authorization': "Bearer $bearer"};

      var response = await client
          .post(Uri.parse("${RestApiUtils.logout}"), headers: _header)
          .timeout(time_out);

      RestApiUtils.GetPrintHeaderBody(
          RestApiUtils.logout, _header, null, response);

      if (response.statusCode == 200) {
        final modelMessage = modelMessageFromJson(response.body);

        if (modelMessage.status == 200) {
          return modelMessage;
        } else {
          return ModelMessage(modelMessage.status,
              RestApiUtils.GetResponse(modelMessage.status));
        }
      } else {
        return ModelMessage(
            response.statusCode, RestApiUtils.GetResponse(response.statusCode));
      }
    } on TimeoutException catch (_) {
      return ModelMessage(408, RestApiUtils.GetResponse(408));
    } on SocketException {
      return ModelMessage(501, RestApiUtils.GetResponse(501));
    } catch (ex) {
      return ModelMessage(510, ex.toString());
    }
  }
}
