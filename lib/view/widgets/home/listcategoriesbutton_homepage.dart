import 'package:ecommerceappn/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../controller/home/homepage_controller.dart';
import '../../../data/model/categoriesmodel.dart';

class ListCategoriesHomeButton extends GetView<HomePAgeControllerImp> {
  const ListCategoriesHomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Categories(
                categoriesModel:
                    CategoriesModel.fromJson(controller.categories[index]),
                i: index);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 15,
            );
          },
          itemCount: 5),
    );
  }
}

class Categories extends GetView<HomePAgeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemsPage(
          controller.categories,
          i!,
          categoriesModel.categoriesId!,
        );
      },
      child: Chip(
        backgroundColor: Colors.white,
        shadowColor: AppColor.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        label: Text(
          categoriesModel.categoriesName!,
          style: const TextStyle(color: AppColor.black),
        ),
        side: BorderSide(color: AppColor.purpule),
      ),
    );
  }
}
