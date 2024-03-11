import 'package:ecommerceappn/controller/home/homepage_controller.dart';
import 'package:ecommerceappn/core/class/statuserequest.dart';
import 'package:ecommerceappn/core/function/hundlingdata.dart';
import 'package:ecommerceappn/data/datasourse/remote/offersdata.dart';
import 'package:ecommerceappn/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersController extends SearchMaxController {
  OffersData offersdata = OffersData(Get.find());
  List<ItemsModel> data = []; //من اجل تخزين البيانات

  getData() async {
    statusRequest = StatusRequest.loading;
    var respons = await offersdata.getData();
    statusRequest =
        handlingData(respons); //عبارة عن دالة تتعامل مع القيمة المرجعة
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        List listdata1 = respons['data'];
        data.addAll(listdata1.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure; //لا يوجد بيانات
      }
    }
    update(); //  GetxController  من اجل تحديث الواجهة  وهي تاتي من كلاس
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }
}
