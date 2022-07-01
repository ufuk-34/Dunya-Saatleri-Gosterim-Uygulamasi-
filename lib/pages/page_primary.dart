import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/primary_controller.dart';
import '../element/page_primary_item_widget.dart';
import '../helper/app_config.dart';

class PagePrimary extends StatefulWidget {
  List? timezoneList;

  PagePrimary({Key? key, this.timezoneList}) : super(key: key);

  @override
  State<PagePrimary> createState() => _PagePrimaryState();
}

class _PagePrimaryState extends State<PagePrimary> {
  final PrimaryController _con = Get.put(PrimaryController());


  @override
  void initState() {
    _con.timezoneList=widget.timezoneList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text("Günaydın Özgür",
                    style: Theme.of(context).textTheme.headline2),
                SizedBox(
                  height: 3,
                ),
                Text("09 : 54", style: Theme.of(context).textTheme.headline2),
                SizedBox(
                  height: 3,
                ),
                Text("8 Haziran , Çarşamba",
                    style: Theme.of(context).textTheme.headline2),
              ],
            ),
            SizedBox(),
            InkWell(
              onTap: () {
                Get.isDarkMode
                    ? Get.changeThemeMode(ThemeMode.light)
                    : Get.changeThemeMode(ThemeMode.dark);
              },
              child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2,color: AppColors.backgraundLightKoyu),
                      color: Theme.of(context).canvasColor,
                      borderRadius: BorderRadius.circular(18)),
                  child: Icon(
                      Get.isDarkMode
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode_outlined,
                      color: Theme.of(context).focusColor,size: 20)),
            )
          ],
        ),
        toolbarHeight: 150,
        leadingWidth: 0,
        leading: Text(""),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      body: NotificationListener<ScrollEndNotification>(
        child: Obx(()=>SingleChildScrollView(
          controller: _con.rrectController,
          scrollDirection: Axis.vertical,
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(_con.gosterimSayisi.value!, (index) {
                return PagePrimaryItemWidget(
                    timezoneName: widget.timezoneList![index]);
              }),
            ),
          ),
        )
        ),
        onNotification: (notification) {
          print(_con.rrectController.position.extentAfter);
          if (_con.rrectController.position.extentAfter <
              1000.0) {
            _con.pageNo++;
           print("Timezone listesine 10 tane daha ekle ve listeyi güncelle");
           if(widget.timezoneList!.length > _con.gosterimSayisi.value!){
             if(widget.timezoneList!.length - _con.gosterimSayisi.value!<10){
               _con.gosterimSayisi.value=  _con.gosterimSayisi.value!+widget.timezoneList!.length - _con.gosterimSayisi.value!;
               _con.gosterimSayisi.refresh();
               print("${_con.gosterimSayisi} tane gösteriliyor...");
             }else{
               _con.gosterimSayisi.value=  _con.gosterimSayisi.value!+10;
               _con.gosterimSayisi.refresh();
               print("${_con.gosterimSayisi} tane gösteriliyor...");
             }

           }else{
             print("sayfa sonu");
           }

          }
          return true;
        },
      ),
    );
  }
}