import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  Color get primaryColor => theme.primaryColor;
  Color get accentColor => Color(0xffffffff);
  Color get canvasColor => theme.canvasColor;
  Color get errorColor => theme.errorColor;
  Color get darkGreyColor => theme.dividerColor;
  Color get primaryLightColor => theme.primaryColorLight;
  Color get primaryDarkColor => theme.primaryColorDark;
  Color get secondaryPink => Color(0xffEB7998);
  Color get secondaryDarkRed => Color(0xffB83000);
  // Color get gradientDark => Color(0xffE20D00);
  Color get secondaryGreen => Color(0xFF2EB18D);
  Color get secondaryDarkBlue => Color(0xFF13064B);
  Color get shadowColor => Color(0xFFBCBCBC);
  Color get gradientLight => Color(0xFFC5B38B);
  Color get gradientDark => Color(0xFFC5B38B);

  Color get highlightColor => theme.highlightColor;

  TextStyle get headline1 => theme.textTheme.headline1!.copyWith(
      fontSize: 40, fontWeight: FontWeight.bold, color: primaryLightColor);
  TextStyle get headline2 => theme.textTheme.headline2!.copyWith(
      fontSize: 30, fontWeight: FontWeight.w600, color: primaryLightColor);
  TextStyle get headline3 => theme.textTheme.headline3!
      .copyWith(fontSize: 25, color: primaryLightColor);
  TextStyle get headline4 => theme.textTheme.headline4!
      .copyWith(fontSize: 20, color: primaryLightColor);
  TextStyle get headline5 => theme.textTheme.headline5!
      .copyWith(fontSize: 18, color: primaryLightColor);
  TextStyle get headline6 => theme.textTheme.headline6!
      .copyWith(fontSize: 16, color: primaryLightColor);
}
