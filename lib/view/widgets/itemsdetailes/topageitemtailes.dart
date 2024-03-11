import 'package:ecommerceappn/controller/itmesdeatailes_controller.dart';
import 'package:ecommerceappn/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../linkapi.dart';

class TopPageProductDetailes extends GetView<ItmesDetailesControllerImp> {
  const TopPageProductDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, //من اجل عدم قص الصورة
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColor.purpule,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
        ),
        Positioned(
            left: Get.width / 8,
            right: Get.width / 8,
            top: 100,
            child: Hero(
              tag: controller.itemsmodel.itemsId
                  .toString(), //هنا وضعنا رقم فريد من اجل عمل انبميشن
              child: CachedNetworkImage(
                imageUrl:
                    "${AppLink.imageitems}/${controller.itemsmodel.itemsImage!}",
                height: 200,
                fit: BoxFit.fill,
              ),
            )),
      ],
    );
  }
}
