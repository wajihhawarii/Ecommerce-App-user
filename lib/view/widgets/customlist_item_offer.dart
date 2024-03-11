import 'package:ecommerceappn/controller/offers_controller.dart';
import 'package:ecommerceappn/core/constant/color.dart';
import 'package:ecommerceappn/core/function/translatedatafrom_database.dart';
import 'package:ecommerceappn/data/model/itemsmodel.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../controller/isfavorate.dart';
import '../../../linkapi.dart';

class CustomListItemOffer extends GetView<OffersController> {
  final ItemsModel itemsModel;
  //final bool active;
  const CustomListItemOffer({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          //  controller.goToPageProductItems(itemsModel);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: AppColor.purpule),
          child: Card(
            elevation: 10,
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
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${itemsModel.itemsPrice!} \$",
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontFamily: "sans")),
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
                              color: Colors.red,
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
