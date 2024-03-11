import 'package:ecommerceappn/Responsive/respons.dart';
import 'package:ecommerceappn/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home/homescreen_controller.dart';
import 'custombottonappbar_screenhome.dart';

class CustomBottomAppBarScreenHome extends StatelessWidget {
  const CustomBottomAppBarScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenContrllerImp>(builder: (controller) {
      return SizedBox(
        height: Responseive.screenHeight / 13.13,
        child: BottomAppBar(
          color: AppColor.purpule,
          shape: const CircularNotchedRectangle(), //تعمل قطع في الشريط
          notchMargin: 9,
          child: Row(
            children: [
              Row(
                children: [
                  ...List.generate(controller.listpage.length + 1, (index) {
                    int i = index > 2 ? index - 1 : index;
                    return index == 2
                        ? const SizedBox(
                            width: 2,
                          )
                        : CustomButtonAppBarScreenHome(
                            textbutton: controller.bottomappbar[i]['title'],
                            icondata: controller.bottomappbar[i]['icon'],
                            onPressed: () {
                              controller.changePage(i);
                            },
                            active: controller.currentpage == i ? true : false);
                  })
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
