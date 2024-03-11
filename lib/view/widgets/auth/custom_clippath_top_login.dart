import 'package:ecommerceappn/Responsive/respons.dart';
import 'package:ecommerceappn/core/constant/color.dart';
import 'package:flutter/material.dart';

import '../../../core/class/clippath.dart';

class CustomClipPathTopLogin extends StatelessWidget {
  const CustomClipPathTopLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClipperTopLogin(), //هو كلاس مسوول عن اطار الخلفية
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.purpule,
        ),
        height: Responseive.screenHeight / 4.2,
        width: double.infinity,
        child: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            "Login \n Inter Your Account ",
            style: TextStyle(
                color: AppColor.white,
                fontSize: 25,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
