import 'package:ecommerceappn/controller/home/homepage_controller.dart';
import 'package:ecommerceappn/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/model/categoriesmodel.dart';
import '../../../linkapi.dart';

class ListCategoriesImageHome extends GetView<HomePAgeControllerImp> {
  const ListCategoriesImageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
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
              width: 10,
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
    return Container(
      height: 240,
      width: 200,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // لون الظل
            spreadRadius: 1, // انتشار الظل
            blurRadius: 5, // درجة ضبابية الظل
            offset: const Offset(0, 3), // إزاحة الظل بالأبعاد الأفقية والعمودية
          ),
        ],
        border: Border.all(
          color: AppColor.purpule, // لون الإطار المطلوب
          width: 1.0, // سمك الإطار المطلوب
        ),
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Click Here For see more...",
            style: TextStyle(color: Colors.black),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              controller.goToItemsPage(
                controller.categories,
                i!,
                categoriesModel.categoriesId!,
              );
            },
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Image.network(
                "${AppLink.imagecategories}/${categoriesModel.categoriesImage}",
                fit: BoxFit.fill,
              ),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Rating 3.5",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: AppColor.purpule),
              ),
              const SizedBox(
                width: 15,
              ),
              Row(
                children: [
                  ...List.generate(
                      5,
                      (index) => const Icon(
                            Icons.star_rate_sharp,
                            size: 18,
                            color: Colors.red,
                          )),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
