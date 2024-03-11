import 'package:ecommerceappn/controller/items_controller.dart';
import 'package:ecommerceappn/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/ListItems.dart';
import '../widgets/home/serachproduct_homepage.dart';
import '../widgets/listcategoriesitems.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.purpule,
        title: const Text(
          "Items",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: AppColor.white,
      body: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: const [
              SearchProductHome(),
              ListCategoriesItems(),
              ListItems(),
            ],
          )),
    );
  }
}
