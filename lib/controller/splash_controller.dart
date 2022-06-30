import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../repository/clock_repository.dart' as api;

class SplashController {
  GlobalKey<ScaffoldState>? scaffoldKey;
  List<dynamic>? timezoneList=[];

  SplashController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  void getTimezoneList() async {
    timezoneList = await api.getTimezoneList();
    if (timezoneList!.isNotEmpty) {
      //   Apiden gelen timezone listesi alındı. Ve anasayfaya geçiliyor...
     // Get.to(PagePrimary(timezoneList: timezoneList));

    }
  }
}
