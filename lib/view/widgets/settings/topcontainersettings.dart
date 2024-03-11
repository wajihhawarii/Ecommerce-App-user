import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/image.dart';

class TopContainerSetting extends StatelessWidget {
  const TopContainerSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, //من اجل عدم قص العناصر في stack
      alignment: Alignment.center,
      children: [
        Container(height: Get.width / 4, color: AppColor.purpule),
        Positioned(
          top: Get.width / 6.9,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(100)),
            child: const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(AppImage.user),
            ),
          ),
        ),
      ],
    );
  }
}
