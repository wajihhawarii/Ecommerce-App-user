import 'package:ecommerceappn/controller/card_controller.dart';
import 'package:ecommerceappn/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MaterButtonCheckOut extends GetView<CradControllerImp> {
  const MaterButtonCheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: AppColor.purpule,
        height: 50,
        onPressed: () {
          controller.goToPageCheckout();
        },
        child: const Text("Check out", style: TextStyle(color: AppColor.white)),
      ),
    );
  }
}
