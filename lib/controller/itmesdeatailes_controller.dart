import 'package:ecommerceappn/core/function/hundlingdata.dart';
import 'package:ecommerceappn/data/datasourse/remote/card.dart';
import 'package:ecommerceappn/data/model/itemsmodel.dart';
import 'package:get/get.dart';
import '../core/class/statuserequest.dart';
import '../core/services/myservices.dart';

abstract class ItemsDetailesController extends GetxController {
  getData();
  addCart(String itemsid);
  deleteCart(String itemsid);
  add();
  remove();
}

class ItmesDetailesControllerImp extends ItemsDetailesController {
  late ItemsModel itemsmodel;
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  CardData cartData = CardData(Get.find());
  int countitems = 0;

  List subItems = [
    {"name": "red", "id": 1, "active": "0"},
    {"name": "yellow", "id": 2, "active": "0"},
    {"name": "black", "id": 3, "active": "1"},
  ];

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    itemsmodel = Get.arguments['items'];
    statusRequest = StatusRequest.success;
    countitems = await getCountItemsCart(itemsmodel.itemsId!);
    update();
  }

  getCountItemsCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var respons = await cartData.getCountCart(
        myServices.sharedPreferences.getString("id")!, itemsid);

    statusRequest =
        handlingData(respons); //عبارة عن دالة تتعامل مع القيمة المرجعة

    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        int countitems = 0;
        countitems = int.parse(respons['data']);
        print("==================================");
        print("$countitems");
        return countitems;
      } else {
        statusRequest = StatusRequest.failure; //لا يوجد بيانات
      }
    } else {
      print(respons);
    }
    // update();
  }

  @override
  addCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var respons = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);

    statusRequest =
        handlingData(respons); //عبارة عن دالة تتعامل مع القيمة المرجعة

    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        //data.addAll(respons['data']);
        Get.snackbar(" warning ", "Data is Add To Cart");
      } else {
        statusRequest = StatusRequest.failure; //لا يوجد بيانات
      }
    } else {
      print(respons);
    }
    update();
  }

  @override
  deleteCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var respons = await cartData.deleteCart(
        myServices.sharedPreferences.getString("id")!, itemsid);

    statusRequest =
        handlingData(respons); //عبارة عن دالة تتعامل مع القيمة المرجعة

    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        //data.addAll(respons['data']);
        Get.snackbar(" warning ", "Data is delete From  Cart");
      } else {
        statusRequest = StatusRequest.failure; //لا يوجد بيانات
      }
    } else {
      print(respons);
    }
    update();
  }

  @override
  add() {
    addCart(itemsmodel.itemsId!);
    countitems++;
    update();
  }

  @override
  remove() {
    if (countitems > 0) {
      deleteCart(itemsmodel.itemsId!);
      countitems--;
      update();
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
