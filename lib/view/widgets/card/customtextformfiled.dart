import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/card_controller.dart';
import '../../../core/constant/color.dart';

class CustomTextFormFiledCard extends GetView<CradControllerImp> {
  const CustomTextFormFiledCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      width: 260,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: AppColor.purpule),
        borderRadius: BorderRadius.circular(15)
      ),
      child: TextFormField(
        controller:controller.coupnname,
        decoration: const InputDecoration(
          border:InputBorder.none,
          hintText: "  Enter Your CouponeCode",
        ),
      ),
    );
  }
}
