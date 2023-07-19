import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Developed by "),
          Text(
            " John Miles Morales 💙",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(" © 2023"),
        ],
      ).box.margin(const EdgeInsets.symmetric(vertical: 20)).make(),
    );
  }
}
