import 'package:ecommerceappn/Responsive/respons.dart';
import 'package:ecommerceappn/controller/auth/login_controller.dart';
import 'package:ecommerceappn/controller/auth/signup_controller.dart';
import 'package:ecommerceappn/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CustomMaterailbuttonLogin extends GetView<LoginControllerImp> {
  const CustomMaterailbuttonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: Responseive.screenHeight / 40,
          bottom: Responseive.screenHeight / 80),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        color: AppColor.purpule,
        minWidth: 200,
        height: Responseive.screenWidth / 10,
        onPressed: () {
          controller.login();
        },
        child: const Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class CustomMaterailbuttonSignup extends GetView<SignUpControllerImp> {
  const CustomMaterailbuttonSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      minWidth: 200,
      color: AppColor.purpule,
      onPressed: () {
        controller.signUp();
      },
      child: const Text(
        "SignUp",
        style: TextStyle(color: Colors.white),
      ),
    ));
  }
}
