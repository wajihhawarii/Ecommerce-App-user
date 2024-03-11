import 'package:ecommerceappn/Responsive/respons.dart';
import 'package:ecommerceappn/controller/checkout_controller.dart';
import 'package:ecommerceappn/core/constant/color.dart';
import 'package:ecommerceappn/core/constant/image.dart';
import 'package:ecommerceappn/core/constant/route.dart';
import 'package:ecommerceappn/view/widgets/check/carddeliveerytype.dart';
import 'package:ecommerceappn/view/widgets/check/cardpaymentmethod.dart';
import 'package:ecommerceappn/view/widgets/check/cardshippingaddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    ChechControllerImp controllerImp = Get.put(ChechControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.purpule,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back, color: AppColor.white, size: 30),
        ),
        title: const Text(
          "Check out",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.white),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: MaterialButton(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            height: Responseive.screenHeight / 16,
            color: AppColor.purpule,
            textColor: AppColor.white,
            child: const Text(
              "Checkout",
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              controllerImp.checkData();
            },
          ),
        ),
      ),
      body: GetBuilder<ChechControllerImp>(
        builder: (controller) => Container(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                const Text(
                  "Choose payment methodes :",
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColor.grey,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: Responseive.screenHeight / 80,
                ),
                InkWell(
                  onTap: () {
                    controller.checkPaymentMethodes("0");
                  },
                  child: CardPaymentMethodCheckout(
                    title: "cash On delivery",
                    isActive: controller.paymentMethod == "0" ? true : false,
                  ),
                ),
                SizedBox(
                  height: Responseive.screenHeight / 80,
                ),
                InkWell(
                  onTap: () {
                    controller.checkPaymentMethodes("1");
                  },
                  child: CardPaymentMethodCheckout(
                    title: "payment Card",
                    isActive: controller.paymentMethod == "1" ? true : false,
                  ),
                ),
                SizedBox(
                  height: Responseive.screenHeight / 40,
                ),
                const Text(
                  "Choose Delivery Type :",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: Responseive.screenHeight / 80,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.checkDeliveryMethodes("0");
                      },
                      child: CardDeliveryTypeCheckout(
                        imagename: AppImage.user,
                        title: "delivery",
                        active: controller.deliveryType == "0" ? true : false,
                      ),
                    ),
                    SizedBox(width: Responseive.screenHeight / 80),
                    InkWell(
                      onTap: () {
                        controller.checkDeliveryMethodes("1");
                      },
                      child: CardDeliveryTypeCheckout(
                        imagename: AppImage.user,
                        title: "deliverythuer",
                        active: controller.deliveryType == "1" ? true : false,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Responseive.screenHeight / 80,
                ),
                if (controller.deliveryType == "0")
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Shipping Address :",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                      if (controller.dataaddress.isEmpty)
                        Center(
                            child: InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoute.addressadd);
                                },
                                child: const Text(
                                  "Pleace Add shipping Address \n Click Here",
                                  textAlign: TextAlign.center,
                                ))),
                      SizedBox(
                        height: Responseive.screenHeight / 80,
                      ),
                      ...List.generate(
                          controller.dataaddress.length,
                          (index) => CardShppingAddressCheckout(
                                onTap: () {
                                  controller.chooseShipingAddress(
                                      controller.dataaddress[index].addressId!);
                                },
                                title:
                                    controller.dataaddress[index].addressName!,
                                body:
                                    "${controller.dataaddress[index].addressStreet!} ${controller.dataaddress[index].addressCity!}",
                                isactive: controller.addressid ==
                                        controller.dataaddress[index].addressId!
                                    ? true
                                    : false,
                              )),
                    ],
                  )
              ],
            )),
      ),
    );
  }
}
