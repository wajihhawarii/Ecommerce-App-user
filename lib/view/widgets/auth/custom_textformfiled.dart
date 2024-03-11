import 'package:ecommerceappn/Responsive/respons.dart';
import 'package:ecommerceappn/core/constant/color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormFiled extends StatelessWidget {
  final String hintText;
  final TextInputType? keyboardType;
  final Icon icon;
  final String? Function(String?)? validator;
  final TextEditingController? mycontroller;
  final int? index;
  final bool? obscureText;
  void Function()? onPressed;

  CustomTextFormFiled({
    super.key,
    required this.hintText,
    required this.keyboardType,
    required this.icon,
    required this.validator,
    required this.mycontroller,
    this.index,
    this.obscureText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Responseive.screenHeight / 80),
      width: Responseive.screenWidth / 1.1,
      child: TextFormField(
        obscureText:
            (obscureText == null || obscureText == false || index == null)
                ? false
                : true,
        validator: validator,
        controller: mycontroller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            fillColor: Colors.grey[200],
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(width: 1, color: AppColor.black)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.blue, width: 3),
              borderRadius: BorderRadius.circular(20),
            ),
            border: InputBorder.none,
            hintStyle: const TextStyle(fontStyle: FontStyle.italic),
            hintText: hintText,
            prefixIcon: icon,
            suffixIcon: index == 1
                ? IconButton(
                    icon: const Icon(Icons.remove_red_eye_outlined),
                    onPressed: onPressed,
                  )
                : null),
      ),
    );
  }
}
