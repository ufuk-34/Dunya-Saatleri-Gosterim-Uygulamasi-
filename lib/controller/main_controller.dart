import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/clock.dart';
import '../repository/clock_repository.dart' as api;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';


class MainController {
  GlobalKey<ScaffoldState>? scaffoldKey;
  GlobalKey<ScaffoldState>? scaffoldKeyPrimary;

  Rx<Clock?> clock = Clock().obs;

  Rx<String?> saat = "".obs;
  Rx<String?> dk = "".obs;
  Rx<String?> year = "".obs;
  Rx<String?> month = "".obs;
  Rx<String?> day = "".obs;

  Rx<String?> yearNow = "".obs;
  Rx<int?> monthNow = 0.obs;
  Rx<int?> dayNow = 0.obs;
  Rx<String?> dayNameNow = "".obs;

  ScrollController rrectController = ScrollController();
  int pageNo = 1;
  List? timezoneList = [];
  Rx<int?> showCount = 10.obs;

  MainController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  void getTimezone(String timezone) async {
    clock.value = await api.getTimezone(timezone);
    clock.refresh();
    print(clock.value!.dayOfWeek.toString());
    if (clock.value != null) {
      dateTimeSplitFunc(clock.value!.datetime!);
    }
  }

  void dateTimeSplitFunc(String datetime) async {
    //2022-06-30T11:28:20.697594+00:00
    String saatBilgisi = datetime.split("T").last.split(".").first; // 11:28:20
    saat.value = saatBilgisi.split(":")[0];
    dk.value = saatBilgisi.split(":")[1];
    saat.refresh();
    dk.refresh();

    String yilBilgisi = datetime.split("T").first; // 2022-06-30
    year.value = yilBilgisi.split("-")[0];
    day.value = yilBilgisi.split("-")[2];

    int monthNumber = int.parse(yilBilgisi.split("-")[1]);
    month.value = getMonthNameWithNumber(monthNumber);

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

  void getDateNow() async{
    yearNow.value = DateTime.now().year.toString();
    monthNow.value = DateTime.now().month;
    dayNow.value = DateTime.now().day;

   await initializeDateFormatting('tr');
    dayNameNow.value = DateFormat('EEEE').format(DateTime.now());  // perşembe
    yearNow.refresh();
    monthNow.refresh();
    dayNow.refresh();
    dayNameNow.refresh();
  }


  /// Search kodları
RxList<dynamic> foundList=[].obs;
  void filterList(String searchInput) {
    List<dynamic> results = [];
    if (searchInput.isEmpty) {
      results = timezoneList!;
    } else {
      results = timezoneList!
          .where((element) => element
          .toString()
          .toLowerCase()
          .contains(searchInput.toLowerCase()))
          .toList();
    }
    foundList.value = results;
  }
}
