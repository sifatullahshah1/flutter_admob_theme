import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_admob_theme/utilities/app_assets.dart';
import 'package:lottie/lottie.dart';

class RestApiUtils {
  RestApiUtils._();

  // APIs Links
  static String ip_config =
      "http://fundraising.sidrafoundation.pk/api/"; //development Link
  static String ImageUrl =
      "http://fundraising.sidrafoundation.pk/storage/avatars/";

  static final String login = ip_config + "login";
  static final String logout = ip_config + "logout";
  static final String dashboard = ip_config + "dashboard";

  //Response Status and Message
  static String error_400 = "Error occurred";
  static String error_401 = "Unauthorized";
  static String error_402 = "Provide all values";
  static String error_404 = "You are not connected to internet";
  static String error_405 = "Method not allowed";
  static String error_408 = "Time out error, Please try again";
  static String error_500 = "Internal server error";
  static String error_501 = "You are not connected to internet";
  static String error_default = "Unknown error occurred";

  static String GetResponse(int status) {
    switch (status) {
      case 400:
        print("HelloGetResponse  error_400 ${error_400}");
        return error_400;
      case 401:
        print("HelloGetResponse  error_401 ${error_401}");
        return error_401;
      case 402:
        print("HelloGetResponse  error_402 ${error_402}");
        return error_402;
      case 404:
        print("HelloGetResponse  error_400 ${error_404}");
        return error_404;
      case 405:
        print("HelloGetResponse  error_405 ${error_405}");
        return error_405;
      case 408:
        print("HelloGetResponse  error_408 ${error_408}");
        return error_408;
      case 500:
        print("HelloGetResponse  error_500 ${error_500}");
        return error_500;
      case 501:
        print("HelloGetResponse  error_501 ${error_501}");
        return error_501;
      default:
        print("HelloGetResponse  error_default ${error_default}");
        return error_default;
    }
  }

  static ShowLoadingDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: Container(
                width: 145,
                height: 145,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Load a Lottie file from your assets
                    Container(
                      width: 80,
                      height: 80,
                      child: Lottie.asset(AppAssets.final_loading_anim,
                          width: 120),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Text(
                      "Loading Data",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle2,
                    )
                  ],
                ),
              ),
            ));
  }

  static void GetPrintHeaderBody(url, header, body, response) {
    // print("HelloGetResponse  url ${url}");
    // print("HelloGetResponse  header ${header}");
    // print("HelloGetResponse  body ${body}");
    // print(
    //     "HelloGetResponse  response ${response.statusCode} : ${response.body}");
  }

  static void GetPrintMessageBody(String key, status, body) {
    print("$key  Message ${GetResponse(status)}");
    print("$key  Body ${body}");
  }
}
