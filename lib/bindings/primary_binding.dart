import 'package:dunya_saatleri_gosterim_uygulamasi/controller/primary_controller.dart';
import 'package:get/get.dart';


class PrimaryBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<PrimaryController>(PrimaryController());
  }
}