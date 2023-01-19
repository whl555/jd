import 'package:flutter/material.dart';

class MyBottomTabItem extends StatelessWidget {
  const MyBottomTabItem({Key? key, required this.icon, required this.label}) : super(key: key);

  final Icon icon;

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 20),
            child: icon,
        ),
        Text(label)
      ],
    );
  }
}
