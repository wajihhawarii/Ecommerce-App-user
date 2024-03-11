import 'package:ecommerceappn/Responsive/respons.dart';
import 'package:ecommerceappn/controller/auth/successrestpassword_controller.dart';
import 'package:ecommerceappn/core/constant/color.dart';
import 'package:ecommerceappn/view/widgets/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccsessResetPasswordControllerImp controller =
        Get.put(SuccsessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.purpule,
        centerTitle: true,
        elevation: 0.0,
        title: Text('Success',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColor.white, fontSize: 40)),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Icon(
              Icons.check_circle_outline,
              size: Responseive.screenHeight / 4,
              color: AppColor.purpule,
            )),
            const Text(
              "....",
              style: TextStyle(fontSize: 40),
            ),
            const Spacer(),
            SizedBox(
                width: double.infinity,
                child: CustomButtomAuth(
                  text: "Go To Login",
                  onPressed: () {
                    controller.goToPageLogin();
                  },
                )),
            SizedBox(
              height: Responseive.screenHeight / 80,
            ),
          ],
        ),
      ),
    );
  }
}
