import 'dart:async';
import 'dart:io';

import 'package:flutter_admob_theme/dashboard/models/model_dashboard.dart';
import 'package:flutter_admob_theme/utilities/rest_api_utils.dart';
import 'package:http/http.dart' as http;

class DashboardService {
  static var time_out = const Duration(seconds: 10);
  static var client = http.Client();

  static Future<ModelDashboard> DashboardFunction(String? bearer) async {
    try {
      Map<String, String> _header = {'Authorization': "Bearer $bearer"};

      var response = await client
          .get(Uri.parse(RestApiUtils.dashboard), headers: _header)
          .timeout(time_out);

      RestApiUtils.GetPrintHeaderBody(
          RestApiUtils.dashboard, _header, null, response);

      if (response.statusCode == 200) {
        final modelDashboard = modelDashboardFromJson(response.body);

        if (modelDashboard.status == 200) {
          return modelDashboard;
        } else {
          return ModelDashboard(
              status: response.statusCode,
              message: RestApiUtils.GetResponse(response.statusCode));
        }
      } else {
        return ModelDashboard(
            status: response.statusCode,
            message: RestApiUtils.GetResponse(response.statusCode));
      }
    } on TimeoutException catch (_) {
      return ModelDashboard(
          status: 408, message: RestApiUtils.GetResponse(408));
    } on SocketException {
      return ModelDashboard(
          status: 501, message: RestApiUtils.GetResponse(501));
    } catch (ex) {
      return ModelDashboard(status: 510, message: "${ex.toString()}");
    }
  }
}
