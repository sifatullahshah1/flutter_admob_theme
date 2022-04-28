import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admob_theme/app_theme_work/text_themes.dart';
import 'package:flutter_admob_theme/app_theme_work/theme_colors.dart';

class LightThemeData {
  LightThemeData._();

  static final border_radius = BorderRadius.all(Radius.circular(5));
  static double border_width = 1;

  static final light_theme = ThemeData(
      backgroundColor: ThemeColors.background_color_lt,
      primaryColorDark: ThemeColors.primary_dark_lt,
      scaffoldBackgroundColor: ThemeColors.scaffold_color_lt,
      canvasColor: ThemeColors.canvas_color_lt,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ThemeColors.primary_dark_lt,
      ),
      colorScheme: ColorScheme(
        primary: ThemeColors.primary_light_lt,
        primaryVariant: ThemeColors.primary_varient_lt,
        secondary: ThemeColors.primary_dark_lt,
        secondaryVariant: ThemeColors.primary_dark_lt,
        surface: Colors.grey,
        background: Colors.white,
        error: Colors.white,
        onPrimary: ThemeColors.primary_light_lt,
        onSecondary: ThemeColors.primary_dark_lt,
        onSurface: Colors.white,
        onBackground: Colors.black87,
        onError: ThemeColors.primary_yellow_lt,
        brightness: Brightness.light,
      ),
      textTheme: TextThemes.textThemeLT,
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ThemeColors.primary_dark_lt),
        elevation: MaterialStateProperty.all(2),
        textStyle: MaterialStateProperty.all(
          TextThemes.app_bar_titleLT,
        ),
      )),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: ThemeColors.textformback_color_lt, // background
        border: OutlineInputBorder(
          borderRadius: border_radius,
          borderSide: BorderSide(
            color: ThemeColors.textformborder_color_lt,
            width: border_width,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: border_radius,
          borderSide: BorderSide(
            color: ThemeColors.textformborder_color_lt,
            width: border_width,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: border_radius,
          borderSide: BorderSide(
            color: ThemeColors.textformborder_color_lt,
            width: border_width,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: border_radius,
          borderSide: BorderSide(
            color: ThemeColors.textformborder_color_lt,
            width: border_width,
          ),
        ),
        suffixIconColor: ThemeColors.suffix_icon_color_lt,
        prefixIconColor: ThemeColors.prefix_icon_color_lt,
        errorStyle: TextThemes.errorStyleLT,
        hintStyle: TextThemes.hintStyleLT,
        labelStyle: TextThemes.labelStyleLT,
        floatingLabelStyle: TextThemes.floatingLabelStyleLT,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: ThemeColors.elevated_button_back_color_lt,
            textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: ThemeColors.appbar_color_lt,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 28,
          ),
          titleTextStyle: TextThemes.app_bar_titleLT,
          actionsIconTheme: IconThemeData(
            color: Colors.white,
            size: 28,
          )),
      cardTheme: CardTheme(
        color: Colors.grey[200],
        elevation: 0,
        // shape: BoxShape.rectangle
      ),
      iconTheme: IconThemeData(color: Colors.black87, size: 25));
}
