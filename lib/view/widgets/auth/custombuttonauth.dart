import 'package:ecommerceappn/Responsive/respons.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class CustomButtomAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtomAuth(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responseive.screenHeight / 17.77,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(vertical: 10),
        onPressed: onPressed,
        color: AppColor.purpule,
        textColor: Colors.white,
        child: Text(text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}
