import 'package:ecommerceappn/controller/itmesdeatailes_controller.dart';
import 'package:ecommerceappn/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubItems extends GetView<ItmesDetailesControllerImp> {
  const SubItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ...List.generate(
            controller.subItems.length,
            (index) => Container(
                  height: 70,
                  width: 100,
                  decoration: BoxDecoration(
                    color: controller.subItems[index]["active"] == "1"
                        ? AppColor.purpule
                        : null,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.red),
                  ),
                  child: Center(
                    child: Text(controller.subItems[index]["name"],
                        style: TextStyle(
                          fontSize: 20,
                          color: controller.subItems[index]["active"] == "1"
                              ? Colors.white
                              : const Color.fromARGB(255, 3, 21, 49),
                        )),
                  ),
                ))
      ],
    );
  }
}
