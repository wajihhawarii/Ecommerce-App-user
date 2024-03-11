import 'package:ecommerceappn/core/constant/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statuserequest.dart';
import '../../core/constant/color.dart';
import '../../core/function/hundlingdata.dart';
import '../../data/datasourse/remote/auth/signu_data.dart';

abstract class SignUpController extends GetxController {
  goToLoginPage();
  signUp() {}
}

class SignUpControllerImp extends SignUpController {
  SignUpData loginData = SignUpData(Get.find());
  TextEditingController? email;
  TextEditingController? password;
  TextEditingController? username;
  TextEditingController? phone;
  StatusRequest? statusRequest = StatusRequest.none;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();

    super.onInit();
  }

  @override
  goToLoginPage() {
    Get.offNamed(AppRoute.loginpage);
  }

  @override
  @override
  signUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(
          email!.text, password!.text, username!.text, phone!.text);
      statusRequest =
          handlingData(response); //عبارة عن دالة تتعامل مع القيمة المرجعة
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.verfiycodesignup, arguments: {
            "email": email!
                .text, //عند انشاء الحساب بنجاح نقوم بارسال  الايمبل الي صفحة كود التاكيد اجباري لانو الباك هيك بدو
          });
        } else {
          Get.defaultDialog(
            title: "Error",
            content: const Text(
              " The account already exists",
              style: TextStyle(color: AppColor.white),
            ),
            titleStyle:
                const TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
            backgroundColor: Colors.red[900],
          );
          statusRequest = StatusRequest.failure;
          update();
        }
      }
    }
  }

  @override
  void dispose() {
    email!.dispose();
    username!.dispose();
    phone!.dispose();
    password!.dispose();
    super.dispose();
  }
}
