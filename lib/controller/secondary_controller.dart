import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/clock.dart';
import '../repository/clock_repository.dart' as api;

class SecondaryController {
  GlobalKey<ScaffoldState>? scaffoldKey;

  Rx<Clock?> clock = Clock().obs;
  Rx<String?> saat = "".obs;
  Rx<String?> dk = "".obs;

  Rx<String?> year = "".obs;
  Rx<String?> month = "".obs;
  Rx<String?> day = "".obs;

  SecondaryController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  void getTimezone(String timezone) async {
    clock.value = await api.getTimezone(timezone);
    clock.refresh();
    print(clock.value!.dayOfWeek.toString());
    if(clock.value !=null){
      dateTimeSplitFunc(clock.value!.datetime!);
    }
  }

  void dateTimeSplitFunc(String  datetime) async {
    //2022-06-30T11:28:20.697594+00:00
    String saatBilgisi=   datetime.split("T").last.split(".").first;  // 11:28:20
    saat.value=  saatBilgisi.split(":")[0];
    dk.value=  saatBilgisi.split(":")[1];
    saat.refresh();
    dk.refresh();

    String yilBilgisi=datetime.split("T").first;  // 2022-06-30
    year.value=yilBilgisi.split("-")[0];
    day.value=yilBilgisi.split("-")[2];

    int monthNumber=int.parse(yilBilgisi.split("-")[1]);
    month.value=getMonthNameWithNumber(monthNumber);

    year.refresh();
    month.refresh();
    day.refresh();
  }

  String getDayNameWithNumber(int dayOfNumber) {
    String dayName = "";
    switch (dayOfNumber) {
      case 1:
        dayName = "Pazartesi";
        break;
      case 2:
        dayName = "Salı";
        break;
      case 3:
        dayName = "Çarşamba";
        break;
      case 4:
        dayName = "Perşembe";
        break;
       case 5:
        dayName = "Cuma";
        break;
      case 6:
        dayName = "Cumartesi";
        break;
      case 7:
        dayName = "Pazar";
        break;
    }
    return dayName;
  }

  String getMonthNameWithNumber(int monthOfNumber) {
    String dayName = "";
    switch (monthOfNumber) {
      case 01:
        dayName = "Ocak";
        break;
      case 02:
        dayName = "Şubat";
        break;
      case 03:
        dayName = "Mart";
        break;
      case 04:
        dayName = "Nisan";
        break;
      case 05:
        dayName = "Mayıs";
        break;
      case 06:
        dayName = "Haziran";
        break;
      case 07:
        dayName = "Temmuz";
        break;
      case 08:
        dayName = "Ağustos";
        break;
      case 09:
        dayName = "Eylül";
        break;
      case 10:
        dayName = "Ekim";
        break;
      case 11:
        dayName = "Kasım";
        break;
      case 12:
        dayName = "Aralık";
        break;
    }
    return dayName;
  }
}
