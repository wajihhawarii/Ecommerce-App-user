import 'package:ecommerceappn/Responsive/respons.dart';
import 'package:ecommerceappn/core/class/hundlingdata.dart';
import 'package:ecommerceappn/core/constant/color.dart';
import 'package:ecommerceappn/core/constant/route.dart';
import 'package:ecommerceappn/core/function/valiadinput.dart';
import 'package:ecommerceappn/view/widgets/auth/custombuttonauth.dart';
import 'package:ecommerceappn/view/widgets/auth/customtextbodyauth.dart';
import 'package:ecommerceappn/view/widgets/auth/customtextformauth.dart';
import 'package:ecommerceappn/view/widgets/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/forgetpassword/forgetpasswordcontroller.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.purpule,
          centerTitle: true,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                Get.toNamed(AppRoute.loginpage);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: AppColor.white,
              )),
          title: Text('Forget Password',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColor.white, fontSize: 30)),
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest!,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
              child: Form(
                key: controller.formstate,
                child: ListView(children: [
                  SizedBox(height: Responseive.screenHeight / 40),
                  const CustomTextTitleAuth(
                    text: "Cheack Email ",
                  ),
                  const CustomTextBodyAuth(
                      text:
                          "Sign Up with Your Email And Password OR contine with socail media"),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 100, "email");
                    },
                    mycontroller: controller.email,
                    hinttext: 'Enter Your Email',
                    iconData: Icons.lock,
                    labeltext: 'Email',
                  ),
                  CustomButtomAuth(
                      text: "Check",
                      onPressed: () {
                        controller.checkemail();
                      }),
                  SizedBox(height: Responseive.screenHeight / 80),
                ]),
              ),
            ),
          ),
        ));
  }
}
