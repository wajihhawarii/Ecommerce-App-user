import 'package:ecommerceappn/core/function/translatedatafrom_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/items_controller.dart';
import '../../core/constant/color.dart';
import '../../data/model/categoriesmodel.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 10,
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return Categories(
            categoriesMadel:
                CategoriesModel.fromJson(controller.categories[index]),
            i: index,
          );
        },
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesMadel; // هو عبارة عن غرض من كلاس اي بي أي
  final int? i;
  const Categories({super.key, required this.i, required this.categoriesMadel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCat(
            i,
            categoriesMadel
                .categoriesId!); //من اجل تغير الخط تحت العنصر المختار
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(3),
            child: GetBuilder<ItemsControllerImp>(
              builder: (controller) => Chip(
                backgroundColor: AppColor.white,
                label: Container(
                  decoration: controller.selectedCat == i
                      ? //من اجل الخط الذي يوضع اسفل التصنيف
                      const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(width: 3, color: Colors.red)))
                      : null,
                  child: Text(
                    translateDataFromDataBase(categoriesMadel.categoriesNameAr,
                        categoriesMadel.categoriesName),
                    style: const TextStyle(color: AppColor.black, fontSize: 17),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
