import 'package:ecommerceappn/controller/itmesdeatailes_controller.dart';
import 'package:ecommerceappn/core/class/hundlingdata.dart';
import 'package:ecommerceappn/core/constant/color.dart';
import 'package:ecommerceappn/view/widgets/itemsdetailes/materailbutton.dart';
import 'package:ecommerceappn/view/widgets/itemsdetailes/topageitemtailes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/price_and_amount.dart';
import '../widgets/itemsdetailes/subitems.dart';

class ItemsDetailes extends StatelessWidget {
  const ItemsDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItmesDetailesControllerImp());
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.white,
              size: 40,
            ),
          ),
          title: const Text(
            "Itmes Detailes",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColor.purpule,
        ),
        bottomNavigationBar: const MaterialButtonItemsDetailes(),
        body: GetBuilder<ItmesDetailesControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: const EdgeInsets.all(2),
              child: ListView(
                children: [
                  const TopPageProductDetailes(),
                  const SizedBox(
                    height: 105,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.itemsmodel.itemsName.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  color: AppColor.black,
                                  fontWeight: FontWeight.w900)),
                      PriceAndAmount(
                        onAdd: () {
                          controller.add();
                        },
                        onRemove: () {
                          controller.remove();
                        },
                        amount: '${controller.countitems}',
                        price: '${controller.itemsmodel.itemsPrice}\$',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                            "${controller.itemsmodel.itemsDesc}${controller.itemsmodel.itemsDesc}${controller.itemsmodel.itemsDesc}${controller.itemsmodel.itemsDesc}${controller.itemsmodel.itemsDesc}${controller.itemsmodel.itemsDesc}${controller.itemsmodel.itemsDesc} ",
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Color",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  color: AppColor.black,
                                  fontWeight: FontWeight.w900)),
                      const SizedBox(
                        height: 10,
                      ),
                      const SubItems(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
