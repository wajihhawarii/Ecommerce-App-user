import "package:ecommerceappn/Responsive/respons.dart";
import "package:ecommerceappn/core/constant/route.dart";
import "package:flutter/material.dart";
import "package:get/get_core/get_core.dart";
import "package:get/get_navigation/get_navigation.dart";

class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: Responseive.screenHeight / 40,
          left: Responseive.screenWidth / 40,
          right: Responseive.screenWidth / 40,
          bottom: Responseive.screenHeight / 26.66),
      child: Row(
        children: [for (int i = 0; i < 3; i++) iconlist[i]],
      ),
    );
  }
}

List iconlist = [
  IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () {
      Get.back();
    },
  ),
  const Spacer(),
  IconButton(
    onPressed: () {
      Get.toNamed(AppRoute.favorate);
    },
    icon: const Icon(
      Icons.favorite_border,
      color: Colors.yellow,
      size: 30,
    ),
  ),
];
