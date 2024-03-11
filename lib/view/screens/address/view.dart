import "package:ecommerceappn/core/class/hundlingdata.dart";
import "package:ecommerceappn/core/constant/color.dart";
import "package:ecommerceappn/core/constant/route.dart";
import "package:ecommerceappn/data/model/addressmodel.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "../../../controller/address/view_controller.dart";

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewControllerImp());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.toNamed(AppRoute.homescreen);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColor.white,
            )),
        title: const Text(
          "Address",
          style: TextStyle(color: AppColor.white),
        ),
        backgroundColor: AppColor.purpule,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.purpule,
        child: const Icon(
          Icons.add,
          color: AppColor.white,
        ),
        onPressed: () {
          Get.toNamed(AppRoute.addressadd);
        },
      ),
      body: GetBuilder<AddressViewControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest!,
          widget: Container(
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return CardAddress(
                  addressmodel: controller.data[index],
                  onDelete: () {
                    controller.deleteAddress(controller.data[index].addressId!);
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressmodel;
  final void Function()? onDelete;
  const CardAddress(
      {super.key, required this.addressmodel, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          title: Text(addressmodel.addressName!),
          subtitle:
              Text("${addressmodel.addressCity} ${addressmodel.addressStreet}"),
          trailing: IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
