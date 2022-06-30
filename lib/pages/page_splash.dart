import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/splash_controller.dart';
import '../helper/app_config.dart';


class PageSplash extends StatefulWidget {
  const PageSplash({Key? key}) : super(key: key);

  @override
  State<PageSplash> createState() => _PageSplashState();
}

class _PageSplashState extends State<PageSplash> {
  final SplashController _con = Get.put(SplashController());
  @override
  void initState() {
    _con.getTimezoneList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgraundDark,
      key: _con.scaffoldKey,
      body: Container(
        alignment: Alignment.center,
        height: App(context).appHeight(99),
        width: App(context).appWidth(99),
        child: Container(
          height: App(context).appHeight(85),
          width: App(context).appWidth(85),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/dop.png")
              )
          ),
        ), ),
    );
  }
}
