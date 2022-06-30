import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/secondary_controller.dart';
import '../helper/app_config.dart';

class PageSecondary extends StatefulWidget {
  String? timezoneName;

  PageSecondary({Key? key, this.timezoneName}) : super(key: key);

  @override
  State<PageSecondary> createState() => _PageSecondaryState();
}

class _PageSecondaryState extends State<PageSecondary> {
  final SecondaryController _con = Get.put(SecondaryController());

  @override
  void initState() {
    _con.getTimezone(widget.timezoneName!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text("WORLD TIME"),
        toolbarHeight: 100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      body: Obx(() => _con.clock.value!.timezone == null
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(10)),
                          alignment: Alignment.center,
                          width: App(context).appWidth(40),
                          height: App(context).appHeight(10),
                          child: Text("12",style: TextStyle(fontSize: 36),),
                        ),
                        Text(" : ",style: TextStyle(fontSize: 36)),
                        Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(10)),
                          alignment: Alignment.center,
                          width: App(context).appWidth(40),
                          height: App(context).appHeight(10),
                          child: Text("12",style: TextStyle(fontSize: 36)),
                        ),
                      ],
                    ),
                    Text(_con.clock.value!.timezone!.split("/").last),
                    Text(_con.clock.value!.timezone!.split("/").first),
                    Text(_con.clock.value!.datetime.toString()),
                    Text(_con.clock.value!.dayOfYear.toString()),
                  ],
                ),
              ),
            )),
    );
  }
}
