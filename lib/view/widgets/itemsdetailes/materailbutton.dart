import 'package:ecommerceappn/core/constant/color.dart';
import 'package:ecommerceappn/core/constant/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class MaterialButtonItemsDetailes extends StatelessWidget {
  const MaterialButtonItemsDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: AppColor.red1),
          borderRadius: BorderRadius.circular(13),
        ),
        height: 50,
        child: MaterialButton(
          color: AppColor.purpule,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {
            Get.toNamed(AppRoute.card);
          },
          child: const Text("GO To Card",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w900)),
        ),
      ),
    );
  }
}
