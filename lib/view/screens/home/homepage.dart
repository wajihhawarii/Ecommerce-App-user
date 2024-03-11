import 'package:ecommerceappn/core/class/hundlingdata.dart';
import 'package:ecommerceappn/core/constant/color.dart';
import 'package:ecommerceappn/view/widgets/home/serachproduct_homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../controller/home/homepage_controller.dart';
import '../../../core/constant/image.dart';
import '../../widgets/home/customappbar_homepage.dart';
import '../../widgets/home/listcategoriesbutton_homepage.dart';
import '../../widgets/home/listcategoriesimage_homepage.dart';
import '../../widgets/home/listitems_search_homepage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePAgeControllerImp homePageController = Get.put(HomePAgeControllerImp());
    return GetBuilder<HomePAgeControllerImp>(
      builder: (controller) => HandlingDataRequest(
        statusRequest: homePageController.statusRequest!,
        widget: Scaffold(
            backgroundColor: AppColor.purpule,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomAppBarHome(),
                    const Text(
                      "  Explore your \n  Favorate products ",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: AppColor.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const SearchProductHome(),
                    !controller.isSearch
                        ? SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.only(top: 30, left: 10),
                              decoration: const BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(60),
                                  )),
                              height: 482,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  for (int i = 0; i <= 5; i++)
                                    listopjctshome[i],
                                ],
                              ),
                            ),
                          )
                        : controller.listdata.isEmpty
                            ? Center(
                                child: Center(
                                  child: Lottie.asset(AppImage.empty),
                                ),
                              )
                            : ListItemsSearchHome(
                                listdatamodel: controller.listdata),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

List listopjctshome = [
  const Padding(
    padding: EdgeInsets.only(bottom: 8.0, left: 4),
    child: Row(
      children: [
        Text(
          "Categories",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 25),
        ),
        Spacer(),
      ],
    ),
  ),
  const SizedBox(
    height: 5,
  ),
  const ListCategoriesHomeButton(),
  const SizedBox(
    height: 10,
  ),
  const ListCategoriesImageHome(),
  const Padding(
    padding: EdgeInsets.all(8.0),
    child: Row(
      children: [
        Text(
          "Best selling products",
          style: TextStyle(
              color: AppColor.black,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 20),
        ),
        Spacer(),
      ],
    ),
  ),
  // const ListItemHome(),
];
