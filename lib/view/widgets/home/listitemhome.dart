import 'package:ecommerceappn/controller/home/homepage_controller.dart';
import 'package:ecommerceappn/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../core/constant/color.dart';
import '../../../linkapi.dart';

class ListItemHome extends GetView<HomePAgeControllerImp> {
  const ListItemHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 10,
          );
        },
        itemCount: controller.items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ItemsHome(
              itemsModel: ItemsModel.fromJson(controller.items[index]));
        },
      ),
    );
  }
}

class ItemsHome extends GetView<HomePAgeControllerImp> {
  final ItemsModel itemsModel;
  const ItemsHome({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToItemsPage(itemsModel);
      },
      child: Stack(
        children: [
          Image.network(
            "${AppLink.imageitems}/${itemsModel.itemsImage}",
            width: 100,
            height: 100,
          ),
          Container(
            //padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColor.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 120,
            width: 180,
          ),
          // Positioned(
          //   left: 60,
          //   bottom: 77,
          //   child: Text(itemsModel.categoriesName.toString()),
          // ),
        ],
      ),
    );
  }
}
