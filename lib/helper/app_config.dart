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
  static Color backgraundLightKoyu = const Color(0xFF39547D);

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
    textTheme: TextTheme(headline1: TextStyle(color: AppColors.textColorLight))
);

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    backgroundColor: AppColors.backgraundLight,
    scaffoldBackgroundColor: AppColors.backgraundLight,
    hintColor: AppColors.textColorLight,
    primaryColor: AppColors.backgraundLight,
    cardColor: AppColors.backgraundLightKoyu,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.backgraundLightKoyu),
    textTheme: TextTheme(headline1: TextStyle(color: AppColors.textColorDark)));
