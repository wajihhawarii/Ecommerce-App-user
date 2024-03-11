import 'package:ecommerceappn/controller/card_controller.dart';
import 'package:ecommerceappn/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCountItems extends GetView<CradControllerImp> {
  const CustomCountItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 5,
        child: Container(
          alignment: Alignment.center,
          height: 60,
          width: double.infinity,
          child: Text("you have (${controller.totalcount}) items in your Card",
              style: const TextStyle(
                  color: AppColor.black,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
