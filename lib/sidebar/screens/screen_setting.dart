import 'package:flutter/material.dart';
import 'package:flutter_admob_theme/app_theme_work/theme_notifier.dart';
import 'package:provider/provider.dart';

class ScreenSetting extends StatefulWidget {
  const ScreenSetting({Key? key}) : super(key: key);

  @override
  _ScreenSettingState createState() => _ScreenSettingState();
}

class _ScreenSettingState extends State<ScreenSetting> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeNotifier>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              themeProvider.gettingThemeMode()
                  ? Icons.dark_mode
                  : Icons.light_mode,
              size: 100,
            ),
            Switch.adaptive(
              //---isDarkMode to return if its dark or not--true or false--
              value: themeProvider.gettingThemeMode(),
              onChanged: (value) {
                final provider =
                    Provider.of<AppThemeNotifier>(context, listen: false);
                provider.updateTheme(value);
              },
              activeColor: themeProvider.gettingThemeMode()
                  ? Colors.purple
                  : Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
