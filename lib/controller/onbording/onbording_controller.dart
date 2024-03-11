import 'package:ecommerceappn/core/constant/route.dart';
import 'package:ecommerceappn/core/services/myservices.dart';
import 'package:ecommerceappn/data/datasourse/static/onbordinglist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBordingController extends GetxController {
  next();
  skip();
  onPageChange(int x);
}

class OnBordingControllerImp extends OnBordingController {
  late PageController pageController;
  int nextpage = 0;
  MyServices myServices = Get.find();

  @override
  next() {
    nextpage = nextpage + 1;
    if (nextpage > onBordingList.length - 1) {
      myServices.sharedPreferences.setString("A", "1");
      Get.offNamed(AppRoute.loginpage);

      // nextpage--;
      // myServices.sharedPreferences.setString("step","1"); //  هنا من اجل عند الدخول اول مرة يحفظ القيمة فس التخزسن النوقت من اجل عدم ان تظهر الوجهات التي يفترض ان لا تظهر مرة اخرى
      //Get.offAllNamed(AppRoute.login);
    } else {
      pageController.animateToPage(
        nextpage,
        duration: const Duration(seconds: 1),
        curve: Curves.linearToEaseOut,
      );
    }
  }

  @override
  onPageChange(int x) {
    nextpage = x;
    update();
  }

  @override
  skip() {
    nextpage--;
    if (nextpage >= 0) {
      pageController.animateToPage(
        nextpage,
        duration: const Duration(seconds: 1),
        curve: Curves.linearToEaseOut,
      );
    } else {}
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
