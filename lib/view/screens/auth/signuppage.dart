import "package:ecommerceappn/Responsive/respons.dart";
import "package:ecommerceappn/controller/auth/signup_controller.dart";
import "package:ecommerceappn/core/class/hundlingdata.dart";
import "package:ecommerceappn/core/constant/color.dart";
import "package:ecommerceappn/core/function/valiadinput.dart";
import "package:ecommerceappn/view/widgets/auth/custom_textformfiled.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "../../widgets/auth/custom_clippath_top_signup.dart";

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp signUpControllerImp = Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColor.purpule),
      body: GetBuilder<SignUpControllerImp>(
          builder: (controller) => HandlingDataRequest(
                statusRequest: signUpControllerImp.statusRequest!,
                widget: ListView(
                  children: [
                    const CustomClipPath(),
                    SizedBox(
                      height: Responseive.screenHeight / 2.55,
                      child: Form(
                        key: signUpControllerImp.formstate,
                        child: Column(
                          children: [
                            CustomTextFormFiled(
                              hintText: "Enter Your Name ",
                              keyboardType: TextInputType.name,
                              icon: const Icon(Icons.person),
                              validator: (val) {
                                return validInput(val!, 5, 50, "username");
                              },
                              mycontroller: signUpControllerImp.username,
                            ),
                            CustomTextFormFiled(
                              hintText: "Enter Your Email ",
                              keyboardType: TextInputType.emailAddress,
                              icon: const Icon(Icons.email),
                              validator: (val) {
                                return validInput(val!, 5, 50, "email");
                              },
                              mycontroller: signUpControllerImp.email,
                            ),
                            CustomTextFormFiled(
                              hintText: "Enter Your phone Number  ",
                              keyboardType: TextInputType.phone,
                              icon: const Icon(Icons.phone),
                              validator: (val) {
                                return validInput(val!, 5, 50, "phone");
                              },
                              mycontroller: signUpControllerImp.phone,
                            ),
                            CustomTextFormFiled(
                              hintText: "Enter Your password ",
                              keyboardType: TextInputType.visiblePassword,
                              icon: const Icon(Icons.lock),
                              validator: (val) {
                                return validInput(val!, 5, 50, "password");
                              },
                              mycontroller: signUpControllerImp.password,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                        child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      minWidth: Responseive.screenWidth / 1.9,
                      color: AppColor.purpule,
                      onPressed: () {
                        signUpControllerImp.signUp();
                      },
                      child: const Text(
                        "SignUp",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                    const Text(
                      "Create your own account to Enter \n  the application ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.all(Responseive.screenHeight / 56),
                      child: Container(
                        width: double.infinity,
                        height: Responseive.screenHeight / 14,
                        decoration: BoxDecoration(
                          color: AppColor.purpule,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TextButton(
                          onPressed: () {
                            signUpControllerImp.goToLoginPage();
                          },
                          child: const Text(
                            "if you have any account Clike Here ...",
                            style: TextStyle(color: AppColor.yellow),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}
