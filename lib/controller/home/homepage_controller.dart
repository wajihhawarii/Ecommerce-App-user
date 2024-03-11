import 'package:ecommerceappn/core/class/statuserequest.dart';
import 'package:ecommerceappn/core/constant/route.dart';
import 'package:ecommerceappn/core/function/hundlingdata.dart';
import 'package:ecommerceappn/data/datasourse/remote/home/homepagedata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/model/itemsmodel.dart';

abstract class HomePageController extends SearchMaxController {
  getData();
  goToItemsPage(List categories, int selectedCat, String categoryid);
}

class HomePAgeControllerImp extends HomePageController {
  List categories = [];
  List items = [];

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //statusRequest = StatusRequest.none;
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }

  @override
  goToItemsPage(List categories, int selectedCat, String categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
      "categoryid": categoryid,
    });
  }
}

class SearchMaxController extends GetxController {
  List<ItemsModel> listdata = [];
  HomeData homeData = HomeData(Get.find());
  StatusRequest? statusRequest;
  TextEditingController? search;

  searchData() async {
    statusRequest = StatusRequest.loading;
    var respons = await homeData.searchData(search!.text);
    statusRequest = handlingData(respons);
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        listdata.clear();
        List responsedata = respons['data'];
        listdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        listdata.clear();
      }
    } else {}
    update();
  }

  bool isSearch = false;
  cheackSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }
}
