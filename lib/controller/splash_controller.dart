import 'package:flutter/material.dart';
import 'package:get/get.dart';import '../pages/page_primary.dart';

import '../repository/clock_repository.dart' as api;
import '../route_generator.dart';

class SplashController {
  GlobalKey<ScaffoldState>? scaffoldKey;
  List<dynamic>? timezoneList=[];

  SplashController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  void getTimezoneList(BuildContext context) async {
    timezoneList = await api.getTimezoneList();
    if (timezoneList!.isNotEmpty) {
      //   Apiden gelen timezone listesi alındı. Ve anasayfaya geçiliyor...
      Navigator.of(context)
          .pushReplacementNamed(RouteName.PRIMARY,arguments: timezoneList);

    }
  }
}
