import 'package:flutter/material.dart';

class CustomButtonLangauge extends StatelessWidget {
  final String langname;
  final String langimage;
  final void Function()? onTap;
  const CustomButtonLangauge(
      {super.key, required this.langname, required this.langimage,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 300,
        child: Center(
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.red,
                backgroundImage: AssetImage(langimage),
                radius: 25,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(langname,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
