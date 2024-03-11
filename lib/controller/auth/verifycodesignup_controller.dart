import 'package:ecommerceappn/core/class/statuserequest.dart';
import 'package:ecommerceappn/core/constant/route.dart';
import 'package:ecommerceappn/core/function/hundlingdata.dart';
import 'package:ecommerceappn/data/datasourse/remote/auth/veryfiycodesignupdata.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verificationCode);
  resend();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VeryfiycodeSignUpData veryfiycodeSignUpData =
      VeryfiycodeSignUpData(Get.find());
  String? email;

  StatusRequest? statusRequest =
      StatusRequest.none; //اعطينا قيمة من اجل ان لايظهر غلط فبي صفحة login

  @override
  goToSuccessSignUp(verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var respons =
        await veryfiycodeSignUpData.postData(email!, verificationCode);
    statusRequest =
        handlingData(respons); //عبارة عن دالة تتعامل مع القيمة المرجعة
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        Get.toNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(
          title: "Eroor",
          middleText: "The code is Eroor",
        );
        statusRequest = StatusRequest.failure; //لا يوجد بيانات
      }
    }
    update(); //  GetxController  من اجل تحديث الواجهة  وهي تاتي من كلاس
    //Get.offNamed(AppRoute.verfiycodesignup);
    //Get.delete<SignUpControllerImp>();   نستخدمها اذا كان الانتقال يتم عن طريق روت وليس غيت بيج
    //عند انشاء الحساب وادخال كود التاكيد بنجاح ماذا سوف يحدث
  }

  @override
  checkCode() {}

  @override
  void onInit() {
    email = Get.arguments["email"]; //0000000000000  هنا لست وليس ماب انتبه
    super.onInit();
  }

  @override
  resend() {
    veryfiycodeSignUpData.reSend(email!);
  }
}
