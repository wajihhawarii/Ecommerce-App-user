import "package:ecommerceappn/Responsive/respons.dart";
import "package:ecommerceappn/core/constant/color.dart";
import "package:flutter/material.dart";
import "package:get/get_utils/get_utils.dart";

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responseive.screenHeight * 0.4,
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColor.purpule,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.account_balance_rounded,
                  size: 40,
                  color: AppColor.white,
                ),
                onPressed: () {},
              ),
              const Spacer(),
              const Icon(
                Icons.menu,
                color: AppColor.white,
                size: 40,
              ),
            ],
          ),
          Text(
            "1".tr,
            style: const TextStyle(
                color: AppColor.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
