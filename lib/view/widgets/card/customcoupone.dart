import 'package:ecommerceappn/controller/card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custommaterailbutton_coupon.dart';
import 'customtextformfiled.dart';

class CustomCoupone extends GetView<CradControllerImp> {
  const CustomCoupone({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
      child: !controller.hidecouponename
          ? Row(
              children: const [
                CustomTextFormFiledCard(),
                CustomMaterailButtonCoupon(),
              ],
            )
          : const Text(
              "The coupon was applied successfully",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
    );
  }
}
