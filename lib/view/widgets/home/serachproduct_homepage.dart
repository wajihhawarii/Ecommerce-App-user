import "package:ecommerceappn/controller/home/homepage_controller.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import '../../../core/constant/color.dart';

class SearchProductHome extends GetView<HomePAgeControllerImp> {
  const SearchProductHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 20, left: 10),
      height: 50,
      width: 360,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        onChanged: (value) {
          controller.cheackSearch(value);
        },
        controller: controller.search!,
        decoration: InputDecoration(
          hintText: "Search your product",
          hintStyle: const TextStyle(
              color: AppColor.blackAccent, fontStyle: FontStyle.italic),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                width: 2,
              )),
          suffixIcon: IconButton(
            onPressed: () {
              if (controller.search!.text != "") {
                controller.onSearchItems();
              }
            },
            icon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
