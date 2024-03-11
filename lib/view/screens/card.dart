import "package:ecommerceappn/controller/card_controller.dart";
import "package:ecommerceappn/core/class/hundlingdata.dart";
import "package:ecommerceappn/core/constant/color.dart";
import 'package:flutter/material.dart';
import "package:get/get.dart";
import "../widgets/card/customcountitems.dart";
import "../widgets/card/customcoupone.dart";
import "../widgets/card/customitem_coupone.dart";
import "../widgets/card/materailbutton_checkout.dart";
import "../widgets/card/pricedetailes.dart";

class CardPage extends StatelessWidget {
  const CardPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(CradControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.purpule,
          foregroundColor: Colors.white,
          title: const Text(
            "MyCard",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<CradControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest!,
            widget: ListView(
              children: [
                const CustomCountItems(),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: controller.listCardModel.length,
                      itemBuilder: (context, index) => CustomItems(
                        title: controller.listCardModel[index].itemsName,
                        subtitle: controller.listCardModel[index].itemsprice,
                        image: controller.listCardModel[index].itemsImage,
                        itemscount: controller.listCardModel[index].countitems,
                        itemid: controller.listCardModel[index].itemsId,
                      ),
                    ),
                  ),
                ),
                const CustomCoupone(),
                CardPriceDetailes(
                  price: controller.totalprice,
                  discount: "${controller.discount} %",
                  shiping: "0 \$",
                  totalprice: controller.getTotalPrice().toString(),
                ),
                const MaterButtonCheckOut(),
              ],
            ),
          ),
        ));
  }
}
