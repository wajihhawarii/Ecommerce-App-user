import 'package:ecommerceappn/controller/onbording/onbording_controller.dart';
import 'package:ecommerceappn/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/get_utils.dart';

import 'package:lottie/lottie.dart';
import '../../data/datasourse/static/onbordinglist.dart';
import '../widgets/onbording/custom_materailbutton.dart';

class OnBording extends StatelessWidget {
  const OnBording({super.key});

  @override
  Widget build(BuildContext context) {
    OnBordingControllerImp controllerImp = Get.put(OnBordingControllerImp());
    return Scaffold(
        backgroundColor: AppColor.white,
        body: PageView.builder(
          controller: controllerImp.pageController,
          onPageChanged: (int x) {
            controllerImp.onPageChange(x);
          },
          itemCount: onBordingList.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    onBordingList[index].title,
                    style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 400,
                    child: Lottie.asset(onBordingList[index].image),
                  ),
                  Text(
                    onBordingList[index].body,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GetBuilder<OnBordingControllerImp>(
                    builder: (controller) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                            onBordingList.length,
                            (index) => AnimatedContainer(
                                  duration: const Duration(seconds: 1),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: controller.nextpage == index
                                        ? AppColor.purpule
                                        : AppColor.grey,
                                  ),
                                  margin: const EdgeInsets.all(10),
                                  height:
                                      controller.nextpage == index ? 15 : 10,
                                  width: controller.nextpage == index ? 20 : 10,
                                )),
                      ],
                    ),
                  ),
                  index == 0
                      ? CustomMaterailButton1(
                          textbutton: "98".tr,
                          onPressed: () {
                            controllerImp.next();
                          },
                        )
                      : CustomMaterailButton1(
                          textbutton: '8'.tr,
                          onPressed: () {
                            controllerImp.next();
                          },
                        ),
                ]);
          },
        ));
  }
}
