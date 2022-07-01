import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/main_controller.dart';
import '../element/page_primary_item_widget.dart';
import '../helper/app_config.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
class PagePrimary extends StatefulWidget {
  List? timezoneList;

  PagePrimary({Key? key, this.timezoneList}) : super(key: key);

  @override
  State<PagePrimary> createState() => _PagePrimaryState();
}

class _PagePrimaryState extends State<PagePrimary> {
  final MainController _con = Get.put(MainController());


  @override
  void initState() {
  _con.getDateNow();
   _con.foundList.value=widget.timezoneList!;
    _con.timezoneList=widget.timezoneList;
    _con.foundList.refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKeyPrimary,
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(8.0),
            child: Container(
              height: 40,
              width: App(context).appWidth(75),
              decoration: BoxDecoration(color: AppColors.backgraundLight,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextField(
                  style: TextStyle(color: AppColors.backgraundDarkAcik),
                  onChanged: (value) => _con.filterList(value),
                  decoration:   InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Search',
                    labelStyle:TextStyle(color: AppColors.backgraundDarkAcik) ,
                    prefixIcon: Icon(Icons.search,color : AppColors.backgraundDarkAcik,),
                  ),
                ),
              ),
            )),

        title: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text("Günaydın Özgür",
                    style: Theme.of(context).textTheme.headline2),
                const SizedBox(
                  height: 3,
                ),
        DigitalClock(
          areaDecoration: BoxDecoration(color: Colors.transparent),
          areaAligment: AlignmentDirectional.center,
          hourMinuteDigitDecoration:
          BoxDecoration(color: Colors.transparent),
          hourMinuteDigitTextStyle: TextStyle(fontSize: 35,color: Theme.of(context).canvasColor),
          showSecondsDigit: false,

        ),
                const SizedBox(
                  height: 3,
                ),
                Text("${_con.dayNow.value!}  ${_con.getMonthNameWithNumber(_con.monthNow.value!)} , ${_con.dayNameNow.value!}",
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
              children: List.generate(_con.foundList.length<10?_con.foundList.length: _con.showCount.value!, (index) {
                return PagePrimaryItemWidget(
                    timezoneName: _con.foundList[index]);
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
           if(_con.foundList.length > _con.showCount.value!){
             if(_con.foundList.length - _con.showCount.value!<10){
               _con.showCount.value=  _con.showCount.value!+_con.foundList.length - _con.showCount.value!;
               _con.showCount.refresh();
               print("${_con.showCount} tane gösteriliyor...");
             }else{
               _con.showCount.value=  _con.showCount.value!+10;
               _con.showCount.refresh();
               print("${_con.showCount} tane gösteriliyor...");
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