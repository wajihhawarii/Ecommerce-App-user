import 'package:ecommerceappn/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/card_controller.dart';

class CustomMaterailButtonCoupon extends GetView<CradControllerImp> {
  const CustomMaterailButtonCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      height: 50,
      onPressed: () {
        controller.checkCoupon();
      },
      color: AppColor.purpule,
      child: const Text("apply",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
    );
  }
}
