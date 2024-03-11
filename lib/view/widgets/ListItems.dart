import 'package:ecommerceappn/controller/isfavorate.dart';
import 'package:ecommerceappn/controller/items_controller.dart';
import 'package:ecommerceappn/core/class/hundlingdata.dart';
import 'package:ecommerceappn/core/function/translatedatafrom_database.dart';
import 'package:ecommerceappn/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../core/constant/color.dart';
import '../../core/constant/image.dart';
import '../../linkapi.dart';

class ListItems extends GetView<ItemsControllerImp> {
  const ListItems({super.key});
  @override
  Widget build(BuildContext context) {
    FavorateController favorateController = Get.put(FavorateController());

    return GetBuilder<ItemsControllerImp>(
      builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest!,
          widget: Container(
              padding: const EdgeInsets.all(10),
              child: controller.items.isEmpty
                  ? Center(
                      child: Lottie.asset(AppImage.empty),
                    )
                  : GridView.builder(
                      shrinkWrap: true, //من اجل الا يظهر غلط
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.items.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.6,
                      ),
                      itemBuilder: (BuildContext context, index) {
                        favorateController.isFavorate[controller.items[index]
                            ["items_id"]] = controller.items[index]["favorate"];
                        return Items(
                          itemsModel:
                              ItemsModel.fromJson(controller.items[index]),
                          index: index,
                        );
                        // }
                      }))),
    );
  }
}

class Items extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  final int index;

  const Items({super.key, required this.itemsModel, required this.index});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageItemsDetailes(itemsModel);
      },
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                  tag: itemsModel.itemsId.toString(),
                  child: Image.network(
                      "${AppLink.imageitems}/${itemsModel.itemsImage!}")),
              Text(
                translateDataFromDataBase(
                    itemsModel.categoriesNameAr, itemsModel.categoriesName),
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Rating 3.5"),
                  Row(
                    children: [
                      ...List.generate(
                          5,
                          (index) => const Icon(
                                Icons.star_rate_sharp,
                                size: 13,
                                color: Colors.lightBlue,
                              )),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(itemsModel.itemsPrice!,
                      style: const TextStyle(
                        color: AppColor.red1,
                        fontSize: 20,
                      )),
                  GetBuilder<FavorateController>(
                    builder: (FavorateController controller) => IconButton(
                        onPressed: () {
                          if (controller.isFavorate[itemsModel.itemsId] ==
                              "1") {
                            // controller.isFavorate[itemsModel.itemsId] = "0";
                            controller.setFavorate(itemsModel.itemsId, "0");
                            controller.removeFavorate(itemsModel.itemsId!);
                          } else {
                            //controller.isFavorate[itemsModel.itemsId] = "1";
                            controller.setFavorate(itemsModel.itemsId, "1");
                            controller.addFavorate(itemsModel.itemsId!);
                          }
                        },
                        icon: Icon(
                          controller.isFavorate[itemsModel.itemsId] == "1"
                              ? Icons.favorite
                              : Icons.favorite_outline_outlined,
                          color: AppColor.red,
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
