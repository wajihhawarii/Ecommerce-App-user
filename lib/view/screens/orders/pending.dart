import 'package:ecommerceappn/controller/orders/pending_controller.dart';
import 'package:ecommerceappn/core/class/hundlingdata.dart';
import 'package:ecommerceappn/core/constant/color.dart';
import 'package:ecommerceappn/core/constant/route.dart';
import 'package:ecommerceappn/view/widgets/orders/cardorderlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingsOrders extends StatelessWidget {
  const PendingsOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingsControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.purpule,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Get.toNamed(AppRoute.homescreen);
            },
          ),
          title: const Text(
            "Ordes Pendings",
            style: TextStyle(color: AppColor.white),
          ),
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: GetBuilder<PendingsControllerImp>(
              builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest!,
                widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) => CardOrdersList(
                    listdata: controller.data[index],
                    index: index,
                  ),
                ),
              ),
            )));
  }
}
