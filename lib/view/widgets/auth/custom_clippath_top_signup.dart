import 'package:ecommerceappn/Responsive/respons.dart';
import 'package:ecommerceappn/core/constant/color.dart';
import 'package:flutter/material.dart';
import '../../../core/class/clippath.dart';

class CustomClipPath extends StatelessWidget {
  const CustomClipPath({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClipperSignUp(),
      child: Container(
        decoration: BoxDecoration(color: AppColor.purpule),
        height: Responseive.screenHeight / 4.4,
        width: double.infinity,
        child: const Text(
          "SignUp \n Create Your Account ",
          style: TextStyle(
              color: AppColor.white,
              fontSize: 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
