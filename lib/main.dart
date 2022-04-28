import 'package:flutter/material.dart';
import 'package:flutter_admob_theme/app_theme_work/dark_theme_data.dart';
import 'package:flutter_admob_theme/app_theme_work/light_theme_data.dart';
import 'package:flutter_admob_theme/screen_splash.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import 'app_theme_work/theme_notifier.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();

  // AdmobManager.loadAppOpenAd();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<AppThemeNotifier>(
        create: (context) => AppThemeNotifier(),
        lazy: false,
        child: Container(
          child: Consumer<AppThemeNotifier>(
            builder: (context, data, child) {
              return MaterialApp(
                title: 'Theme App',
                debugShowCheckedModeBanner: false,
                theme: LightThemeData.light_theme,
                darkTheme: DarkThemeData.dark_theme,
                // home: MyHomePage(),
                home: ScreenSplash(),

                // home: AnimSliderWidget(),
                themeMode: data.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
              );
            },
          ),
        ),
      ),
    );
  }
}
