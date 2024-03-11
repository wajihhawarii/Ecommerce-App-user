import 'package:ecommerceappn/controller/home/homescreen_controller.dart';
import 'package:ecommerceappn/core/constant/color.dart';
import 'package:ecommerceappn/core/constant/route.dart';
import 'package:ecommerceappn/view/widgets/home/custombottomappbar_screenhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenContrllerImp homeScreenController =
        Get.put(HomeScreenContrllerImp());
    return GetBuilder<HomeScreenContrllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColor.white,
        bottomNavigationBar: const CustomBottomAppBarScreenHome(),
        floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.purpule,
            onPressed: () {
              Get.toNamed(AppRoute.card);
            },
            child: const Icon(
              Icons.shopping_cart_checkout,
              color: AppColor.yellow,
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: homeScreenController.listpage
            .elementAt(homeScreenController.currentpage),
      ),
    );
  }
}
