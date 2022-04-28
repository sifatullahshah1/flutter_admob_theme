import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admob_theme/app_theme_work/text_themes.dart';
import 'package:flutter_admob_theme/app_theme_work/theme_colors.dart';

class DarkThemeData {
  DarkThemeData._();

  static final border_radius = BorderRadius.all(Radius.circular(5));
  static double border_width = 1;

  static final dark_theme = ThemeData(
    backgroundColor: ThemeColors.background_color_dt,
    primaryColorDark: ThemeColors.primary_dark_dt,
    scaffoldBackgroundColor: ThemeColors.scaffold_color_dt,
    canvasColor: ThemeColors.canvas_color_dt,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ThemeColors.primary_dark_dt,
    ),
    colorScheme: ColorScheme(
      primary: ThemeColors.primary_light_dt,
      primaryVariant: ThemeColors.primary_varient_dt,
      secondary: ThemeColors.primary_dark_dt,
      secondaryVariant: ThemeColors.primary_dark_dt,
      surface: Colors.grey,
      background: Colors.white,
      error: Colors.white,
      onPrimary: ThemeColors.primary_light_dt,
      onSecondary: ThemeColors.primary_dark_dt,
      onSurface: Colors.white,
      onBackground: Colors.black87,
      onError: ThemeColors.primary_yellow_dt,
      brightness: Brightness.dark,
    ),
    textTheme: TextThemes.textThemeDT,
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all(ThemeColors.text_back_color_dt),
      elevation: MaterialStateProperty.all(2),
      textStyle: MaterialStateProperty.all(
        TextThemes.app_bar_titleDT,
      ),
    )),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: ThemeColors.textformback_color_dt, // background
      border: OutlineInputBorder(
        borderRadius: border_radius,
        borderSide: BorderSide(
          color: ThemeColors.textformborder_color_dt,
          width: border_width,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: border_radius,
        borderSide: BorderSide(
          color: ThemeColors.textformborder_color_dt,
          width: border_width,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: border_radius,
        borderSide: BorderSide(
          color: ThemeColors.textformborder_color_dt,
          width: border_width,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: border_radius,
        borderSide: BorderSide(
          color: ThemeColors.textformborder_color_dt,
          width: border_width,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: ThemeColors.elevated_button_back_color_dt,
          textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: ThemeColors.appbar_color_dt,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 28,
        ),
        titleTextStyle: TextThemes.app_bar_titleDT,
        actionsIconTheme: IconThemeData(
          color: Colors.white,
          size: 28,
        )),
    cardTheme: CardTheme(
      color: Colors.grey[200],
      elevation: 0,
      // shape: BoxShape.rectangle
    ),
    iconTheme: IconThemeData(color: Colors.black87, size: 25),
  );
}
