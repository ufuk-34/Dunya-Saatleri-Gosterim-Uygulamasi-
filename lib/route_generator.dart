import 'package:dunya_saatleri_gosterim_uygulamasi/pages/page_primary.dart';
import 'package:flutter/material.dart';

import 'pages/page_splash.dart';




class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RouteName.SPLASH:
      return MaterialPageRoute(builder: (_) => PageSplash());
      case RouteName.PRIMARY:
      return MaterialPageRoute(builder: (_) => PagePrimary(timezoneList: args as List));
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}


class RouteName{
  static const SPLASH = '/Splash';
  static const PRIMARY = '/Primary';
}