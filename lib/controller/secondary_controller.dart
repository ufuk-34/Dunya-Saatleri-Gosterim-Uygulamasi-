import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/clock.dart';
import '../repository/clock_repository.dart' as api;

class SecondaryController {
  GlobalKey<ScaffoldState>? scaffoldKey;

  Rx<Clock?> clock = Clock().obs;

  SecondaryController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  void getTimezone(String timezone) async {
    clock.value = await api.getTimezone(timezone);
    clock.refresh();
    print(clock.value!.dayOfWeek.toString());
  }
}
