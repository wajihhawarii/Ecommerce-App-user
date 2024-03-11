import 'package:flutter/material.dart';

class CardPaymentMethodCheckout extends StatelessWidget {
  final String title;
  final bool isActive;
  const CardPaymentMethodCheckout(
      {Key? key, required this.title, required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: isActive == true ? Colors.red : Colors.grey,
          borderRadius: BorderRadius.circular(20)),
      child: Text(title,
          style: TextStyle(
              color: isActive == true ? Colors.white : Colors.red,
              height: 1,
              fontWeight: FontWeight.bold)),
    );
  }
}
