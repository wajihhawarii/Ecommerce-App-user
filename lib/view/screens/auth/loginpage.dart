import 'package:ecommerceappn/Responsive/respons.dart';
import 'package:ecommerceappn/controller/auth/login_controller.dart';
import 'package:ecommerceappn/core/class/hundlingdata.dart';
import 'package:ecommerceappn/core/constant/color.dart';
import 'package:ecommerceappn/view/widgets/auth/custom_materailbutton.dart';
import "package:flutter/material.dart";
import "package:get/get.dart";
import '../../../core/function/valiadinput.dart';
import '../../widgets/auth/custom_clippath_bottom_login.dart';
import '../../widgets/auth/custom_clippath_top_login.dart';
import '../../widgets/auth/custom_textformfiled.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp loginControllerImp = Get.put(LoginControllerImp());

    return Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(backgroundColor: AppColor.purpule),
        body: GetBuilder<LoginControllerImp>(builder: (controller) {
          return HandlingDataRequest(
              statusRequest: controller.statusRequest!,
              widget: ListView(children: [
                const CustomClipPathTopLogin(),
                SizedBox(
                  height: Responseive.screenHeight / 20,
                ),
                SizedBox(
                    child: Form(
                  key: loginControllerImp.formstate,
                  child: Column(children: [
                    CustomTextFormFiled(
                      mycontroller: loginControllerImp.email,
                      validator: (val) {
                        return validInput(val!, 5, 100, "email");
                      },
                      hintText: " pleace Enter Your Email ",
                      icon: const Icon(Icons.email),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    CustomTextFormFiled(
                      obscureText: loginControllerImp.isshaowpassword,
                      onPressed: () {
                        loginControllerImp.showPassword();
                      },
                      index: 1,
                      mycontroller: loginControllerImp.password,
                      validator: (val) {
                        return validInput(val!, 5, 50, "password");
                      },
                      hintText: " pleace Enter Your password ",
                      icon: const Icon(Icons.lock_open_sharp),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(right: Responseive.screenWidth / 20),
                      child: Row(
                        children: [
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              controller.goToForgetPassword();
                            },
                            child: const Text(
                              "ForgePassWord -->",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: AppColor.green,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const CustomMaterailbuttonLogin(),
                    const Text(
                      "Login to your account to get  \n all your saved data",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                        height: Responseive.screenHeight > 820
                            ? Responseive.screenHeight / 15
                            : Responseive.screenHeight / 35.33),
                    CustomClipPathBottomLogin(
                      onPressed: () {
                        loginControllerImp.signUp();
                      },
                    ),
                  ]),
                ))
              ]));
        }));
  }
}
