import 'package:ecommerceappn/controller/myfavorate_controller.dart';
import 'package:ecommerceappn/core/class/hundlingdata.dart';
import 'package:ecommerceappn/core/constant/color.dart';
import 'package:ecommerceappn/core/constant/route.dart';
import 'package:ecommerceappn/view/widgets/customlistfavorateitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorate extends StatelessWidget {
  const MyFavorate({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavorateController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.purpule,
        leading: IconButton(
          onPressed: () {
            Get.toNamed(AppRoute.homescreen);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
        ),
        title: Text(
          "MyFavorate",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<MyFavorateController>(
          builder: (controller) => ListView(
            children: [
              HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.7),
                    itemCount: controller.data.length,
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(), //لاالغاء السكرول في ال القاىمة
                    itemBuilder: (context, index) {
                      return CustomListFavorateItem(
                          itemsModel: controller.data[index]);
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
