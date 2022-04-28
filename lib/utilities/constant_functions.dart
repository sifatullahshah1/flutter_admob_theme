import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admob_theme/utilities/app_assets.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConstantFunctions {
  ConstantFunctions._();

  static final now = DateTime.now();
  static final formattedAMPM = DateFormat('a').format(now);
  static final formattedTime = DateFormat('hh:mm ').format(now);
  static final formattedDate1 = DateFormat('EEE, d MMM').format(now);
  static final formattedDate2 = DateFormat('dd-MM-yyyy').format(now);
  static final formattedDatefinal = DateFormat('dd-MM-yy');
  static final calendar_formate_now = DateFormat('EE, dd-MM-yyyy');
  static final calendar_formate = DateFormat('dd-MM-yyyy');

  static const double padding = 20;
  static const double avatarRadius = 45;

  static Widget ShowProgressLoadingView(context) => Center(
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
                child: Lottie.asset(AppAssets.final_loading_anim, width: 120),
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
      );

  static Future<bool> getSharePrefModebool(String _key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool return_key = (prefs.getBool(_key) ?? false);
    print("isDarkMode isDarkModeOn $return_key");
    return return_key;
  }

  static Future<String> getSharePrefModeString(String _key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String return_key = (prefs.getString(_key) ?? "no_value");
    print("isDarkMode return_key $return_key");
    return return_key;
  }

  static Future<int> getSharePrefModeInt(String _key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int return_key = (prefs.getInt(_key) ?? 1);
    print("isDarkMode return_key $return_key");
    return return_key;
  }

  static void saveSharePrefModebool(String _key, bool _value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, _value);
    print("isDarkMode isDarkModeOn $_value");
  }

  static void saveSharePrefModeString(String _key, String _value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, _value);
    print("isDarkMode isDarkMfodeOn $_value");
  }

  static void saveSharePrefModeInt(String _key, int _value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key, _value);
    print("isDarkMode isDarkModeOn $_value");
  }

  // static Future openLink(String url) => _launchUrl(url);

  // static Future openEmail(
  //     {required String toEmail,
  //     required String subject,
  //     required String body}) async {
  //   try {
  //     final url =
  //         'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}';
  //     await _launchUrl(url);
  //   } catch (e) {
  //     print('openEmail ${e.toString()}');
  //   }
  // }

  // static Future openPhoneCall({required String phoneNumber}) async {
  //   try {
  //     final url = 'tel:$phoneNumber';
  //     if (await canLaunch(url)) {
  //       await _launchUrl(url);
  //     } else {
  //       print('canLaunch false');
  //     }
  //     await _launchUrl(url);
  //   } catch (e) {
  //     print('openPhoneCall ${e.toString()}');
  //   }
  // }

  // static Future openSMS(
  //     {@required String phoneNumber, @required String message}) async {
  //   try {
  //     if (Platform.isAndroid) {
  //       final url = 'sms:$phoneNumber ?body=$message';
  //       if (await canLaunch(url)) {
  //         await _launchUrl(url);
  //       }
  //     }
  //   } catch (e) {
  //     print('openSMS ${e.toString()}');
  //   }
  // }
  //
  // static Future _launchUrl(String url) async {
  //   try {
  //     if (await canLaunch(url)) {
  //       await launch(url);
  //     }
  //   } catch (e) {
  //     print('_launchUrl ${e.toString()}');
  //   }
  // }

  static PageRouteBuilder OpenNewActivity(screen) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, _) {
        return FadeTransition(opacity: animation, child: screen);
      },
    );
  }

  static PageRouteBuilder? OpenNewScreenClean(context, material_route_page) {
    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (context, animation, _) {
            return FadeTransition(
                opacity: animation, child: material_route_page);
          },
        ),
        (Route<dynamic> route) => false);
  }


  // static List<ModelCountry> countries = [
  //   ModelCountry(
  //       name: "Pakistan",
  //       flag: "🇵🇰",
  //       code: "+92",
  //       iso: "PAK",
  //       iso_code: "PK",
  //       currency: "pkr",
  //       currency_symbol: "Rs.",
  //       time_zone: "Asia/Karachi",
  //       latitude: 33.6844,
  //       longitude: 73.0479),
  //   ModelCountry(
  //       name: "Australia",
  //       flag: "🇦🇺",
  //       code: "+61",
  //       iso: "AUS",
  //       iso_code: "AU",
  //       currency: "aud",
  //       currency_symbol: "A\$.",
  //       time_zone: "Australia/Melbourne",
  //       latitude: -25.274398,
  //       longitude: 133.775136),
  // ];
}
