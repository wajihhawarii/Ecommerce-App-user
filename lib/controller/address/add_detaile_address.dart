import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statuserequest.dart';
import '../../core/constant/route.dart';
import '../../core/function/hundlingdata.dart';
import '../../core/services/myservices.dart';

import '../../data/datasourse/remote/address.dart';

class AddAddressDetailesController extends GetxController {
  TextEditingController? name;
  TextEditingController? street;
  TextEditingController? city;

  MyServices myServices = Get.find();

  AddressData testData = AddressData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  //List data = []; //من اجل تخزين البيانات

  addAdress() async {
    statusRequest = StatusRequest.loading;
    update();

    var respons = await testData.addData(
      myServices.sharedPreferences.getString("id")!,
      name!.text,
      city!.text,
      street!.text,
    );
    statusRequest =
        handlingData(respons); //عبارة عن دالة تتعامل مع القيمة المرجعة
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        Get.offAllNamed(AppRoute.addressview);
      } else {
        statusRequest = StatusRequest.failure; //لا يوجد بيانات
      }
    }
    update(); //  GetxController  من اجل تحديث الواجهة  وهي تاتي من كلاس
  }

  @override
  void onInit() {
    name = TextEditingController();
    street = TextEditingController();
    city = TextEditingController();
    super.onInit();
  }
}
