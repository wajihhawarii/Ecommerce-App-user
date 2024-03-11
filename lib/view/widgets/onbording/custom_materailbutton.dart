import 'package:ecommerceappn/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomMaterailButton1 extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;

  const CustomMaterailButton1(
      {super.key, this.onPressed, required this.textbutton});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.purpule,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        elevation: 10,
        splashColor: AppColor.purpule,
        child: Text(textbutton,
            style: const TextStyle(color: AppColor.white, fontSize: 26)),
      ),
    );
  }
}
