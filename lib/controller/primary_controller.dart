import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrimaryController {
  GlobalKey<ScaffoldState>? scaffoldKey;


  ScrollController  rrectController = ScrollController();
  int pageNo = 1;
  List? timezoneList=[];
  Rx<int?> gosterimSayisi = 10.obs;
  PrimaryController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }


}
