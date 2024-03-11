import 'package:ecommerceappn/controller/isfavorate.dart';
import 'package:ecommerceappn/controller/offers_controller.dart';
import 'package:ecommerceappn/core/class/hundlingdata.dart';
import 'package:ecommerceappn/core/constant/route.dart';
import 'package:ecommerceappn/view/widgets/customappbar.dart';
import 'package:ecommerceappn/view/widgets/customlist_item_offer.dart';
import 'package:ecommerceappn/view/widgets/home/listitems_search_homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    Get.put(FavorateController());
    return GetBuilder<OffersController>(
        builder: (controller) => Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                // elevation: 5,
                color: Colors.white,
                child: ListView(children: [
                  CustomAppBar1(
                    onPressedserach: () {
                      if (controller.search!.text != "") {
                        controller.onSearchItems();
                      }
                    },
                    mycontroller: controller.search!,
                    onChanged: (val) {
                      controller.cheackSearch(val);
                    },
                    titleappbar: 'Find Your Product',
                    onPressedIconFavorite: () {
                      Get.toNamed(AppRoute.favorate);
                    },
                  ),
                  !controller.isSearch
                      ? HandlingDataRequest(
                          statusRequest: controller.statusRequest!,
                          widget: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return CustomListItemOffer(
                                  itemsModel: controller.data[index]);
                            },
                            itemCount: controller.data.length,
                          ),
                        )
                      : ListItemsSearchHome(listdatamodel: controller.listdata),
                ]),
              ),
            ));
  }
}
