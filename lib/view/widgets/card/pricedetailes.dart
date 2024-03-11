import 'package:flutter/material.dart';

class CardPriceDetailes extends StatelessWidget {
  final String? price;
  final String? discount;
  final String? shiping;
  final String? totalprice;

  const CardPriceDetailes({
    super.key,
    required this.price,
    required this.discount,
    required this.shiping,
    required this.totalprice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 150,
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.red),
            borderRadius: BorderRadius.circular(30),
            color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                const Text("price", style: TextStyle(fontSize: 20)),
                const Spacer(),
                Text(
                  "${price!} \$",
                  style: const TextStyle(fontSize: 20, color: Colors.red),
                ),
              ],
            ),
            const Divider(color: Colors.grey, height: 1),
            Row(
              children: [
                const Text("discount",
                    style: TextStyle(
                      fontSize: 20,
                    )),
                const Spacer(),
                Text(
                  discount!,
                  style: const TextStyle(fontSize: 20, color: Colors.red),
                ),
              ],
            ),
            const Divider(color: Colors.grey, height: 1),
            Row(
              children: [
                const Text("shiping", style: TextStyle(fontSize: 20)),
                const Spacer(),
                Text(
                  shiping!,
                  style: const TextStyle(fontSize: 20, color: Colors.red),
                ),
              ],
            ),
            const Divider(color: Colors.grey, height: 1),
            Row(
              children: [
                const Text("totalPrice", style: TextStyle(fontSize: 20)),
                const Spacer(),
                Text(
                  "${totalprice!} \$",
                  style: const TextStyle(fontSize: 20, color: Colors.red),
                ),
              ],
            ),
            const Divider(color: Colors.grey, height: 2),
          ],
        ),
      ),
    );
  }
}
