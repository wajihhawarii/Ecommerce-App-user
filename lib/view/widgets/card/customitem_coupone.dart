import 'package:ecommerceappn/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/card_controller.dart';
import '../../../core/constant/color.dart';

class CustomItems extends GetView<CradControllerImp> {
  final String? title;
  final String? subtitle;
  final String? image;
  final String? itemscount;
  final String? itemid;
  const CustomItems({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.itemscount,
    required this.itemid,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        width: 200,
        child: Card(
          shadowColor: AppColor.purpule,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
            child: Row(children: [
              SizedBox(
                height: 80,
                width: 90,
                child: Image.network(
                  "${AppLink.imageitems}/${image!}",
                  fit: BoxFit.fill,
                ),
              ),
              // const SizedBox(
              //   width: 40,
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title!,
                      style: const TextStyle(
                          color: AppColor.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(
                    subtitle!,
                    style: const TextStyle(
                        color: Colors.redAccent,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              // const SizedBox(
              //   width: 100,
              // ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      print("111111111111111111111111");
                      controller.addDataView(itemid!);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.purpule,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 40,
                        height: 25,
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    child: Text(itemscount!,
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  InkWell(
                    onTap: () {
                      controller.deleteDataView(itemid!);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.purpule,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 40,
                        height: 25,
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
            ]),
          ),
        ));
  }
}
