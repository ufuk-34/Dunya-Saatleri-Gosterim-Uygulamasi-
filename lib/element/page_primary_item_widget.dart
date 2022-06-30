import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/app_config.dart';
import '../model/clock.dart';
import '../pages/page_secondary.dart';

class PagePrimaryItemWidget extends StatelessWidget {
  String? timezoneName;

  PagePrimaryItemWidget({Key? key, this.timezoneName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          height: 63,
          width: App(context).appWidth(90),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: InkWell(
                onTap: () {
                  Get.to(PageSecondary(
                    timezoneName: timezoneName,
                  ));
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 55,
                  width: App(context).appWidth(85),
                  decoration: BoxDecoration(
                      color: Theme.of(context).focusColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "${timezoneName!.split("/").first},${timezoneName!.split("/").last}",
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .merge(TextStyle(fontSize: 14)),
                    ),
                  ),
                )),
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                color: Theme.of(context).focusColor,
                border:
                    Border.all(width: 2, color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(15)),
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Theme.of(context).canvasColor,
              size: 10,
            ),
          ),
        )
      ],
    );
  }
}
