import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/primary_controller.dart';
import '../element/page_primary_item_widget.dart';

class PagePrimary extends StatefulWidget {
  List? timezoneList;

  PagePrimary({Key? key, this.timezoneList}) : super(key: key);

  @override
  State<PagePrimary> createState() => _PagePrimaryState();
}

class _PagePrimaryState extends State<PagePrimary> {
  final PrimaryController _con = Get.put(PrimaryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      color: Theme.of(context).canvasColor,
                      borderRadius: BorderRadius.circular(18)),
                  child: Icon(
                      Get.isDarkMode
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode_outlined,
                      color: Theme.of(context).focusColor)),
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(widget.timezoneList!.length, (index) {
              return PagePrimaryItemWidget(
                  timezoneName: widget.timezoneList![index]);
            }),
          ),
        ),
      ),
    );
  }
}
