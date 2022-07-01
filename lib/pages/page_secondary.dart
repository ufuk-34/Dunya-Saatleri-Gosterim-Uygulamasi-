import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/main_controller.dart';
import '../helper/app_config.dart';

class PageSecondary extends StatefulWidget {
  String? timezoneName;

  PageSecondary({Key? key, this.timezoneName}) : super(key: key);

  @override
  State<PageSecondary> createState() => _PageSecondaryState();
}

class _PageSecondaryState extends State<PageSecondary> {
  final MainController _con = Get.put(MainController());

  @override
  void initState() {
    _con.getTimezone(widget.timezoneName!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      appBar: AppBar(titleSpacing: 0.5,
        elevation: 0,
        centerTitle: true,
        title: Text("WORLD TIME",style: Theme.of(context).textTheme.headline4,),
        toolbarHeight: 60,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: Theme.of(context).canvasColor)),
      ),
      body: Obx(() => _con.clock.value!.timezone == null
          ? const Center(child: CircularProgressIndicator())
          : Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            border: Border.all(color: Theme.of(context).hintColor),
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                        width: App(context).appWidth(40),
                        height: App(context).appHeight(15),
                        child: Text(
                          _con.saat.value!,  style: Theme.of(context).textTheme.headline3
                        ),
                      ),
                        Text(" : ",   style: Theme.of(context).textTheme.headline3),
                      Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            border: Border.all(color: Theme.of(context).hintColor),
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                        width: App(context).appWidth(40),
                        height: App(context).appHeight(15),
                        child: Text(_con.dk.value!,  style: Theme.of(context).textTheme.headline3),
                      ),
                    ],
                  ),
                  SizedBox(height: 35),
                  Text(_con.clock.value!.timezone!.split("/").last,
                      style: Theme.of(context).textTheme.headline2),
                  SizedBox(height: 5),
                  Text(
                    _con.clock.value!.timezone!.split("/").first,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${_con.getDayNameWithNumber(_con.clock.value!.dayOfWeek!)}, ${_con.clock.value!.abbreviation} ${_con.clock.value!.utcOffset}",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(height: 2),
                  Text(
                    "${_con.month} ${_con.day},  ${_con.year}",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
            )),
    );
  }
}
