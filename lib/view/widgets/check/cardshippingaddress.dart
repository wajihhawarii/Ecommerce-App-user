import 'package:flutter/material.dart';

class CardShppingAddressCheckout extends StatelessWidget {
  final String title;
  final String body;
  final bool isactive;
  final void Function()? onTap;
  const CardShppingAddressCheckout(
      {Key? key,
      required this.title,
      required this.body,
      required this.isactive,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: isactive ? Colors.red : Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Text(title,
              style: TextStyle(
                  color: isactive ? Colors.grey : null,
                  fontWeight: FontWeight.bold)),
          subtitle: Text(body,
              style: TextStyle(
                  color: isactive ? Colors.grey : null,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
