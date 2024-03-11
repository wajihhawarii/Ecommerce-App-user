import 'package:ecommerceappn/core/constant/route.dart';
import 'package:ecommerceappn/core/services/myservices.dart';
import 'package:ecommerceappn/data/datasourse/remote/itemsdata.dart';
import 'package:ecommerceappn/data/datasourse/remote/myfavoratedata.dart';
import 'package:ecommerceappn/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/class/statuserequest.dart';
import '../core/function/hundlingdata.dart';
import 'home/homepage_controller.dart';

abstract class ItemsController extends SearchMaxController {
  intialData();
  getItems(String categoryid);
  changeCat(selected, categoriesid);
  goToPageItemsDetailes(ItemsModel items);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int? selectedCat;
  String? categoryid;
  List items = [];
  //Map isFavorte = {};
  MyServices myServices = Get.find();
  ItemsData itemsData = ItemsData(Get.find());

  setFavorate(index, val) {
    // isFavorte[index] = val;
    update();
  }

  @override
  intialData() {
    categories = Get.arguments['categories'];
    selectedCat =
        Get.arguments['selectedCat']; //من اجل وضع علامة عند التصنيف الذي اختار
    categoryid = Get.arguments['categoryid'];
    getItems(categoryid!);
  }

  @override
  getItems(String? categoryid) async {
    statusRequest = StatusRequest.loading;
    items.clear();
    var response = await itemsData.getData(
        myServices.sharedPreferences.getString("id")!, categoryid!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        items.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  @override
  changeCat(selected, categoriesid) {
    categoryid = categoriesid;
    selectedCat = selected;
    getItems(categoryid);
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    intialData();

    super.onInit();
  }

  @override
  goToPageItemsDetailes(ItemsModel items) {
    Get.toNamed(AppRoute.itemsdetailes, arguments: {"items": items});
  }

  bool foof = false;
  MyFavorateData myFavorateData = MyFavorateData(Get.find());
}
