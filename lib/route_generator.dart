import 'package:flutter/material.dart';

import 'pages/page_splash.dart';




class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.SPLASH:
      return MaterialPageRoute(builder: (_) => PageSplash());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}


class RouteName{
  static const SPLASH = '/Splash';
}