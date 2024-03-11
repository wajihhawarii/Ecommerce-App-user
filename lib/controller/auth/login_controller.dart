import 'package:ecommerceappn/core/class/statuserequest.dart';
import 'package:ecommerceappn/core/constant/color.dart';
import 'package:ecommerceappn/core/services/myservices.dart';
import 'package:ecommerceappn/data/datasourse/remote/auth/login_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

import '../../core/constant/route.dart';
import '../../core/function/hundlingdata.dart';

abstract class LoginController extends GetxController {
  login();
  signUp();
  goToForgetPassword();
  showPassword();
}

class LoginControllerImp extends LoginController {
  
  LoginData loginData = LoginData(Get.find());
  TextEditingController? email;
  TextEditingController? password;
  StatusRequest? statusRequest = StatusRequest.none;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isshaowpassword = true;

  MyServices myServices = Get.find();
  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email!.text, password!.text);
      statusRequest =
          handlingData(response); //عبارة عن دالة تتعامل مع القيمة المرجعة
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          myServices.sharedPreferences
              .setString("id", response['data']['users_id']);
          // ignore: unused_local_variable
          String userid = myServices.sharedPreferences.getString("id")!;
          myServices.sharedPreferences
              .setString("username", response['data']['users_name']);
          myServices.sharedPreferences
              .setString("email", response['data']['users_email']);
          myServices.sharedPreferences
              .setString("phone", response['data']['users_phone']);
          myServices.sharedPreferences.setString("step", "2");
          FirebaseMessaging.instance
              .subscribeToTopic("users"); // firebase من اجل اشعرات
          FirebaseMessaging.instance
              .subscribeToTopic("users$userid"); // firebase من اجل اشعرات
          Get.offNamed(AppRoute.homescreen);
        } else {
          Get.defaultDialog(
            title: "Error",
            content: const Text(
              "Email Or PassWord is Error",
              style: TextStyle(color: AppColor.white),
            ),
            titleStyle:
                const TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
            backgroundColor: AppColor.red,
          );
          statusRequest = StatusRequest.failure;
          update();
        }
      }
    }
  }

  @override
  signUp() {
    Get.offNamed(AppRoute.signuppage);
  }

  @override
  goToForgetPassword() {
    Get.offNamed(AppRoute.forgetPassword);
    throw UnimplementedError();
  }

  @override
  showPassword() {
    isshaowpassword = isshaowpassword == true ? false : true;
    update(); //من اجل ان يتم التعديل في واجهة المستخدم
  }

  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    //انتبه لاتنفذ الا عند الانتقال بشك نهاىي الي صفحة اخرى اما اذا اضفت صفحة فوقها لن تنفذ وسوف يعطي مشاكل
    super.dispose();
    email!.dispose();
    password!.dispose();
  }
}
