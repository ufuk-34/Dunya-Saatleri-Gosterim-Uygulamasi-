import 'package:dunya_saatleri_gosterim_uygulamasi/pages/page_secondary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/primary_controller.dart';


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
        title: Text(""),
        toolbarHeight: 150,
        leadingWidth: 0,
        leading: Text(""),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.isDarkMode ? Get.changeThemeMode(ThemeMode.light):Get.changeThemeMode(ThemeMode.dark);
            },
            child:   Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Get.isDarkMode ? Icons.light_mode_outlined:Icons.dark_mode_outlined),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: List.generate(widget.timezoneList!.length, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Get.to(PageSecondary(
                    timezoneName: widget.timezoneList![index],
                  ));
                },
                trailing: Icon(Icons.arrow_forward_ios_sharp),
                leading: Text(widget.timezoneList![index]),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(
                    color: Colors.black,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
