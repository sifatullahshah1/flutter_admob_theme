import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admob_theme/app_theme_work/theme_colors.dart';

class TextThemes {
  TextThemes._();

  static String poppins_bold = "PoppinsBold";
  static String poppins_light = "PoppinsLight";
  static String poppins_medium = "PoppinsMedium";
  static String poppins_regular = "PoppinsRegular";
  static String poppins_semi_bold = "PoppinsSemiBold";

  static var errorStyleLT = TextStyle();
  static var hintStyleLT = TextStyle();
  static var labelStyleLT = TextStyle();
  static var floatingLabelStyleLT = TextStyle();

  static var app_bar_titleLT = TextStyle(
      fontSize: 22,
      fontFamily: poppins_medium,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      letterSpacing: 0.15);

  static var app_bar_titleDT = app_bar_titleLT.copyWith(color: Colors.white);

  static var button_text = TextStyle(
      fontSize: 19,
      fontFamily: poppins_medium,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      letterSpacing: 1);

  static var textformfield = TextStyle(
      fontSize: 20,
      // wordSpacing: 12,
      fontFamily: poppins_medium,
      fontWeight: FontWeight.w600,
      letterSpacing: 1);

  // Description
  static var heading_01 =
      TextStyle(fontSize: 96, fontFamily: poppins_light, letterSpacing: -1.5);

  static var heading_02 = TextStyle(
      fontSize: 22,
      // wordSpacing: 12,
      fontFamily: poppins_light,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.25);

  static var heading_03 = TextStyle(
      fontSize: 19,
      // wordSpacing: 12,
      fontFamily: poppins_light,
      fontWeight: FontWeight.w600,
      height: 1);

  //Dialog Normal Text
  static var heading_04 = TextStyle(
      fontSize: 15,
      // wordSpacing: 12,
      fontFamily: poppins_light,
      fontWeight: FontWeight.w500,
      letterSpacing: 1);

  // Description
  static var heading_05 = TextStyle(
      fontSize: 16,
      // wordSpacing: 12,
      fontFamily: poppins_light,
      // fontWeight: FontWeight.w500,
      letterSpacing: -0.5);

  ///TextFormField
  static var heading_06 = TextStyle(
      fontSize: 24,
      // wordSpacing: 12,
      fontFamily: poppins_light,
      // fontWeight: FontWeight.w500,
      letterSpacing: -1.5);

  static var subtitle_01 = TextStyle(
      fontSize: 16,
      // wordSpacing: 12,
      // fontFamily: circulat_std_bold,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      letterSpacing: 2);

  static var subtitle_02 = TextStyle(
      fontSize: 16,
      // wordSpacing: 12,
      // fontFamily: circulat_std_bold,
      fontWeight: FontWeight.w700,
      color: ThemeColors.primary_dark_lt,
      letterSpacing: 2);

  static var caption = TextStyle(
      fontSize: 16,
      // wordSpacing: 12,
      // fontFamily: circulat_std_bold,
      fontWeight: FontWeight.w700,
      color: ThemeColors.primary_dark_lt,
      letterSpacing: 2);

  static var bodyText_01 = TextStyle(
      fontSize: 19,
      // wordSpacing: 12,
      fontFamily: poppins_light,
      fontWeight: FontWeight.w400,
      letterSpacing: 1);

  static var bodyText_02 = TextStyle(
      fontSize: 18,
      // wordSpacing: 12,
      fontFamily: poppins_light,
      fontWeight: FontWeight.w400,
      letterSpacing: 1);

  static var overline = TextStyle(
      fontSize: 17, fontWeight: FontWeight.w400, color: Colors.grey[500]);

  static final textThemeLT = TextTheme(
    headline1: heading_01.copyWith(color: ThemeColors.headline1_color_lt),
    headline2: heading_02.copyWith(color: ThemeColors.headline2_color_lt),
    headline3: heading_03.copyWith(color: ThemeColors.headline3_color_lt),
    headline4: heading_04.copyWith(color: ThemeColors.headline4_color_lt),
    headline5: heading_05.copyWith(color: ThemeColors.headline5_color_lt),
    headline6: heading_06.copyWith(color: ThemeColors.headline6_color_lt),
    subtitle1: subtitle_01.copyWith(color: ThemeColors.subtitle1_color_lt),
    subtitle2: subtitle_02.copyWith(color: ThemeColors.subtitle2_color_lt),
    bodyText1: bodyText_01.copyWith(color: ThemeColors.bodyText1_color_lt),
    bodyText2: bodyText_02.copyWith(color: ThemeColors.bodyText2_color_lt),
    caption: caption.copyWith(color: ThemeColors.caption_color_lt),
    overline: overline.copyWith(color: ThemeColors.overline_color_lt),
  );

  static final textThemeDT = TextTheme(
    headline1: heading_01.copyWith(color: ThemeColors.headline1_color_dt),
    headline2: heading_02.copyWith(color: ThemeColors.headline2_color_dt),
    headline3: heading_03.copyWith(color: ThemeColors.headline3_color_dt),
    headline4: heading_04.copyWith(color: ThemeColors.headline4_color_dt),
    headline5: heading_05.copyWith(color: ThemeColors.headline5_color_dt),
    headline6: heading_06.copyWith(color: ThemeColors.headline6_color_dt),
    subtitle1: subtitle_01.copyWith(color: ThemeColors.subtitle1_color_dt),
    subtitle2: subtitle_02.copyWith(color: ThemeColors.subtitle2_color_dt),
    bodyText1: bodyText_01.copyWith(color: ThemeColors.bodyText1_color_dt),
    bodyText2: bodyText_02.copyWith(color: ThemeColors.bodyText2_color_dt),
    caption: caption.copyWith(color: ThemeColors.caption_color_dt),
    overline: overline.copyWith(color: ThemeColors.overline_color_dt),
  );
}
