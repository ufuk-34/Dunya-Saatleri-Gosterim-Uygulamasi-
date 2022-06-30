import 'package:flutter/material.dart';

class App {
  BuildContext? _context;
  double? _height;
  double? _width;
  double? _heightPadding;
  double? _widthPadding;

  App(_context) {
    this._context = _context;
    MediaQueryData _queryData = MediaQuery.of(_context);
    _height = _queryData.size.height / 100.0;
    _width = _queryData.size.width / 100.0;
    _heightPadding = _height ??
        -((_queryData.padding.top + _queryData.padding.bottom) / 100.0);
    _widthPadding =
        _width ?? -(_queryData.padding.left + _queryData.padding.right) / 100.0;
  }

  double appHeight(double v) {
    return _height! * v;
  }

  double appWidth(double v) {
    return (_width! * v);
  }

  double appVerticalPadding(double v) {
    return _heightPadding! * v;
  }

  double appHorizontalPadding(double v) {
//    int.parse(settingRepo.setting.mainColor.replaceAll("#", "0xFF"));
    return _widthPadding! * v;
  }
}

class AppColors {
  static Color backgraundDark = const Color(0xFF002359);

  static Color backgraundDarkAcik = const Color(0xFF02327E);

  static Color backgraundLight = const Color(0xffffffff);
  static Color backgraundLightKoyu = const Color(0xFFb8b4da);

  static Color textColorDark = const Color(0xffffffff);
  static Color textColorLight = const Color(0xFF002359);
}

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: AppColors.backgraundDark,
    scaffoldBackgroundColor: AppColors.backgraundDark,
    hintColor: AppColors.textColorLight,
    primaryColor: AppColors.backgraundDark,
    cardColor: AppColors.backgraundDarkAcik,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.backgraundDarkAcik),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w100,
          color: AppColors.textColorDark,
          height: 1.0),
      headline2: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
          color: AppColors.textColorDark,
          height: 1.0),
      headline3: TextStyle(
          fontSize: 45.0,
          fontWeight: FontWeight.w500,
          color: AppColors.textColorDark,
          height: 1.0),
      headline4: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          color: AppColors.textColorDark,
          height: 1.0),
    ));

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    backgroundColor: AppColors.backgraundLight,
    scaffoldBackgroundColor: AppColors.backgraundLight,
    hintColor: AppColors.textColorDark,
    primaryColor: AppColors.backgraundLight,
    cardColor: AppColors.backgraundLight,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.backgraundLightKoyu),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w100,
          color: AppColors.textColorLight,
          height: 1.0),
      headline2: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
          color: AppColors.textColorLight,
          height: 1.0),
      headline3: TextStyle(
          fontSize: 45.0,
          fontWeight: FontWeight.w500,
          color: AppColors.textColorLight,
          height: 1.0),
      headline4: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          color: AppColors.textColorLight,
          height: 1.0),
    ));
