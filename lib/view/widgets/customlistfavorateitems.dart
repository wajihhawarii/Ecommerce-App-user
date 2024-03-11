import 'package:ecommerceappn/controller/myfavorate_controller.dart';
import 'package:ecommerceappn/data/model/myfavorate.dart';
import 'package:ecommerceappn/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';

class CustomListFavorateItem extends GetView<MyFavorateController> {
  final MyFavorateModel itemsModel;
  //final bool active;
  const CustomListFavorateItem({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //  controller.goToPageProductItems(itemsModel);
      },
      child: Card(
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
              // Text(
              //   translateDataBase(itemsModel.categoriesNameAr, itemsModel.categoriesName),
              //   style:
              //       const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              // ),
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
                                size: 17,
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
                          color: AppColor.red,
                          fontSize: 20,
                          fontFamily: "sans")),
                  IconButton(
                    onPressed: () {
                      controller.deleteDataFromFavorate(itemsModel.favorateId!);
                    },
                    icon: const Icon(Icons.delete_outline_outlined,
                        color: Colors.red),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
