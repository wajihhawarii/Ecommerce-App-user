import "package:ecommerceappn/core/class/hundlingdata.dart";
import "package:ecommerceappn/core/constant/color.dart";
import "package:ecommerceappn/core/constant/route.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "../../../controller/address/add_detaile_address.dart";
import "../../widgets/customtextform_address.dart";

class AddressAddDetailes extends StatelessWidget {
  const AddressAddDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressDetailesController conroller =
        Get.put(AddAddressDetailesController());
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.toNamed(AppRoute.addressview);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColor.white,
            ),
          ),
          title: const Text(
            "add detailes address",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColor.purpule,
        ),
        body: GetBuilder<AddAddressDetailesController>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormAddress(
                            hinttext: "Enter your name ",
                            labeltext: "Enter your name",
                            iconData: Icons.assessment,
                            mycontroller: conroller.name,
                            valid: (val) {
                              return null;
                            },
                            isNumber: false),
                        CustomTextFormAddress(
                            hinttext: "Enter your city ",
                            labeltext: "Enter your city",
                            iconData: Icons.assessment,
                            mycontroller: conroller.city,
                            valid: (val) {
                              return null;
                            },
                            isNumber: false),
                        CustomTextFormAddress(
                            hinttext: "Enter your street ",
                            labeltext: "Enter your street",
                            iconData: Icons.assessment,
                            mycontroller: conroller.street,
                            valid: (val) {
                              return null;
                            },
                            isNumber: false),
                        MaterialButton(
                          height: 45,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: AppColor.purpule,
                          onPressed: () {
                            controller.addAdress();
                          },
                          child: const Text(
                            "Add Address",
                            style:
                                TextStyle(color: AppColor.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ), //                          controller.addAdress();
                )));
  }
}
