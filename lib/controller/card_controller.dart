import "package:ecommerceappn/core/class/statuserequest.dart";
import "package:ecommerceappn/core/constant/route.dart";
import "package:ecommerceappn/core/services/myservices.dart";
import "package:ecommerceappn/data/datasourse/remote/card.dart";
import "package:ecommerceappn/data/model/cardmodel.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "../core/function/hundlingdata.dart";

abstract class CradController extends GetxController {
  getDataView();
  addDataView(String itemsid);
  deleteDataView(String itemsid);
}

class CradControllerImp extends CradController {
  int? discountcoupon = 0;

  String? couponname;
  double priceorders = 0.0;

  String? couponid;

  StatusRequest? statusRequest;
  MyServices myServices = Get.find();
  CardData cardData = CardData(Get.find());
  CardModel cardModel = CardModel();
  List<CardModel> listCardModel = [];
  TextEditingController? coupnname;
  String discount = "0";
  bool hidecouponename = false;
  String totalprice = "0";
  String totalcount = "0";

  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cardData.checkCoupon(coupnname!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        discount = response['data']['coupon_discount'];
        hidecouponename = true;
      } else {
        statusRequest = StatusRequest.failure;
        if (coupnname!.text == "") {
          Get.snackbar("Error", "Your Code is Error",
              colorText: Colors.red,
              titleText: const Text("Error",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.bold)),
              messageText: const Text(
                "pleace Enter Your code ",
                style: TextStyle(fontSize: 18),
              ),
              //backgroundColor: Colors.white,
              snackPosition: SnackPosition.TOP,
              duration: 5.seconds);
        } else {
          Get.snackbar("Error", "Your Code is Error",
              colorText: Colors.red,
              titleText: const Text("Error",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.bold)),
              messageText: const Text(
                "Your Code is Error",
                style: TextStyle(fontSize: 18),
              ),
              //backgroundColor: Colors.white,
              snackPosition: SnackPosition.TOP,
              duration: 5.seconds);
        }
      }
      update();
    }
  }

  getTotalPrice() {
    return double.parse(totalprice) -
        (double.parse(totalprice) * double.parse(discount) / 100);
  }

  @override
  getDataView() async {
    statusRequest = StatusRequest.loading;
    var response =
        await cardData.viewCart(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == "success") {
          List responesdata = response['datacart']['data'];
          totalcount = response['countprice']['totalcount'];
          totalprice = response['countprice']['totalprice'];
          listCardModel.clear();
          listCardModel.addAll(responesdata.map((e) => CardModel.fromJson(e)));
        }
      } else {
        statusRequest = StatusRequest.failure;
        print("33333333333333333333333333333");
      }
      update();
    }
  }

  @override
  void onInit() {
    coupnname = TextEditingController();
    getDataView();
    super.onInit();
  }

  goToPageCheckout() {
    if (listCardModel.isEmpty) return Get.snackbar("تنبيه", "السله فارغه");
    Get.toNamed(AppRoute.checkout, arguments: {
      "couponid": couponid ?? "0",
      "priceorder": priceorders.toString(),
      "discountcoupon": discountcoupon.toString()
    });
  }

  @override
  addDataView(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cardData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar("Add items succsess", "Add items succsess");
        refrachPage();
      } else {
        print("#########################################");
        statusRequest = StatusRequest.failure;
      }
      update();
    } else {
      print("00000000000000000000000000000000000000000000");
    }
  }

  @override
  deleteDataView(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cardData.deleteCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar("delete items succsess", "delete items succsess");
        refrachPage();
      } else {
        statusRequest = StatusRequest.failure;
        Get.snackbar("Error", "Error");
        print("@@@@@@@@@@@@@@@@@@@@@@@@@Error@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
      }
      update();
    }
  }

  refrachPage() {
    getDataView();
  }
}
