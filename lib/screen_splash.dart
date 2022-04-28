import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_admob_theme/data/database_user.dart';
import 'package:flutter_admob_theme/login/screens/screen_phone_login.dart';
import 'package:flutter_admob_theme/utilities/app_assets.dart';
import 'package:flutter_admob_theme/utilities/constant_functions.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_theme_work/theme_notifier.dart';
import 'dashboard/screens/screen_dashboard.dart';
import 'data/model_user.dart';

class ScreenSplash extends StatefulWidget {
  @override
  _ScreenSplashState createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  DatabaseUser databaseUser = DatabaseUser();
  ModalUser? modalUser;

  bool isDarkMode = false;
  var dashboardChanges;

  @override
  void initState() {
    // Provider.of<AppThemeNotifier>(context, listen: false);

    getThemeMode().then((boolVal) {
      dashboardChanges = Provider.of<AppThemeNotifier>(context, listen: false);
      dashboardChanges.updateTheme(boolVal);
    });

    Timer(Duration(seconds: 3), callback);
    super.initState();
  }

  Future<bool> getThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('theme_id_dark_mode') ?? false;
  }

  void callback() {
    ConstantFunctions.getSharePrefModebool("is_user_verified")
        .then((is_user_verified) {
      print("object : is_user_verified : $is_user_verified");

      if (is_user_verified) {
        databaseUser.initializeDatabase().then((value) {
          databaseUser.GetSingleRecord().then((value) {
            ConstantFunctions.OpenNewScreenClean(
                context, ScreenDashboard(modalUser: value));
          });
        });
      } else {
        ConstantFunctions.OpenNewScreenClean(context, ScreenPhoneLogin());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Load a Lottie file from your assets
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage(
                AppAssets.app_icon,
              ),
            ),

            SizedBox(
              height: 10,
            ),
            Text(
              "Theme App",
              style: Theme.of(context).textTheme.headline3,
            )
          ],
        ),
      ),
    );
  }
}
