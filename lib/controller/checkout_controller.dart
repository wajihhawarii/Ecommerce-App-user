import 'package:ecommerceappn/core/class/statuserequest.dart';
import 'package:ecommerceappn/core/constant/route.dart';
import 'package:ecommerceappn/core/function/hundlingdata.dart';
import 'package:ecommerceappn/core/services/myservices.dart';
import 'package:ecommerceappn/data/datasourse/remote/address.dart';
import 'package:ecommerceappn/data/datasourse/remote/checkout_data.dart';
import 'package:get/get.dart';
import '../data/model/addressmodel.dart';

abstract class CheckController extends GetxController {
  checkPaymentMethodes(String val);
  checkDeliveryMethodes(String val);
  chooseShipingAddress(String val);
  getShipingAdderess();
}

class ChechControllerImp extends CheckController {
  AddressData addressData = Get.put(AddressData(Get
      .find())); //كان من الممكن ان نبني داتا اخرى لكن كلما وفرنا ريكويست ع سيرفر افضل
  CheckOutData checkOutData = Get.put(CheckOutData(Get.find()));
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List<AddressModel> dataaddress = [];

  String? paymentMethod;
  String? deliveryType;
  String addressid = "0";
  String? couponid;
  String? priceorder;
  String? coupondiscount;

  @override
  chooseShipingAddress(String val) {
    addressid = val;
    update();
  }

  @override
  checkDeliveryMethodes(String val) {
    deliveryType = val;
    update();
  }

  @override
  checkPaymentMethodes(String val) {
    paymentMethod = val;
    update();
  }

  @override
  getShipingAdderess() async {
    statusRequest = StatusRequest.loading;

    var respons = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);
    statusRequest =
        handlingData(respons); //عبارة عن دالة تتعامل مع القيمة المرجعة
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        List listdata = respons['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        addressid = dataaddress[0].addressId!.toString();
      } else {
        statusRequest = StatusRequest.failure; //لا يوجد بيانات
      }
    }
    update(); //  Getx
  }

  checkData() async {
    if (paymentMethod == null) {
      return Get.snackbar("Error", "Pleace Selecte PaymentMethod");
    }
    if (deliveryType == null) {
      return Get.snackbar("Error", "Pleace Selecte deliveryType ");
    }
    if (dataaddress.isEmpty) {
      return Get.snackbar("Error", "pleace shipping Address");
    }
    statusRequest = StatusRequest.loading;
    Map data = {
      "usersid": myServices.sharedPreferences.getString("id"),
      "addressid": addressid.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": "10",
      "ordersprice": priceorder,
      "couponid": couponid,
      "paymentmethodes": paymentMethod.toString(),
      "discountcoupon": coupondiscount,
    };
    var respons = await checkOutData.checkOut(data);
    statusRequest =
        handlingData(respons); //عبارة عن دالة تتعامل مع القيمة المرجعة
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        // List listdata = respons['data'];
        // dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        Get.offAllNamed(AppRoute.homescreen);
        Get.snackbar("Sccess", "Your Order Was success");
      } else {
        statusRequest = StatusRequest.none; //لا يوجد بيانات
        Get.snackbar("Error", "Pleace Try Again");
      }
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorder = Get.arguments['priceorder'];
    coupondiscount = Get.arguments['discountcoupon'].toString();
    getShipingAdderess();
    super.onInit();
  }
}
