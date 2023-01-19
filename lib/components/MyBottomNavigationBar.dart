import 'package:flutter/material.dart';
import 'package:jd/components/widget_extensions/ext.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        const DecoratedBox(
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.8),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffEAEAEA),
                  spreadRadius: 7,
                  blurRadius: 25,
                  offset: Offset(0, 4),
                )
              ]
            )
        ).sized(width: double.infinity, height: 88),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: children,
        )
      ],
    ).sized(height: 88);
  }
}
