import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeNotifier extends ChangeNotifier {
  bool isDarkModeOn = true;
  bool gettingThemeMode() => isDarkModeOn;

  void updateTheme(bool isDarkModeOn) async {
    this.isDarkModeOn = isDarkModeOn;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('theme_id_dark_mode', isDarkModeOn);
    notifyListeners();
  }
}
