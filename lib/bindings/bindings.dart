import 'package:ecommerceappn/core/class/curd.dart';
import 'package:get/get.dart';

class InialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Curd()); // Api كلاس المسؤول عن
  }
}
