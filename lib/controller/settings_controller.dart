import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../core/constant/route.dart';
import '../core/services/myservices.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();

  logout() {
    String userid = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.loginpage);
  }
}
