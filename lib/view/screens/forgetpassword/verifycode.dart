import 'package:ecommerceappn/Responsive/respons.dart';
import 'package:ecommerceappn/controller/forgetpassword/verifycode_controller.dart';
import 'package:ecommerceappn/view/widgets/auth/customtextbodyauth.dart';
import 'package:ecommerceappn/view/widgets/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';

class VerfiyCodeResetPassWord extends StatelessWidget {
  const VerfiyCodeResetPassWord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.purpule,
        elevation: 0.0,
        title: Text('Verification Code',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: AppColor.white, fontSize: 40)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          SizedBox(height: Responseive.screenHeight / 40),
          const CustomTextTitleAuth(text: "Check code"),
          SizedBox(height: Responseive.screenHeight / 80),
          CustomTextBodyAuth(
              text: "pleace Enter The Didit Code sent To ${controller.email} "),
          SizedBox(height: Responseive.screenHeight / 53.33),
          OtpTextField(
            fieldWidth: 50,
            borderRadius: BorderRadius.circular(20),
            numberOfFields: 5,
            filled: true,
            borderColor: const Color(0xff111111),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {
              // Get.toNamed(AppRoute.loginpage);
              controller.goToResetPassword(verificationCode);
            }, // end onSubmit
          ),
        ]),
      ),
    );
  }
}
