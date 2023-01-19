import 'package:flutter/material.dart';
import 'package:jd/app/theme/app_theme.dart';
import 'package:jd/components/MyBottomNavigationBar.dart';
import 'package:jd/components/my_bottom_tab_item.dart';
import 'package:jd/components/my_bottom_tab_item.dart';
import 'package:jd/components/my_bottom_tab_item.dart';
import 'package:jd/components/my_bottom_tab_item.dart';
import 'package:jd/components/widget_extensions/ext.dart';
import 'package:jd/pages/cart.dart';
import 'package:jd/pages/category.dart';
import 'package:jd/pages/home.dart';
import 'package:jd/pages/person.dart';

class IndexPage2 extends StatefulWidget {
  const IndexPage2({Key? key}) : super(key: key);

  @override
  State<IndexPage2> createState() => _IndexPage2State();
}

class _IndexPage2State extends State<IndexPage2> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    const add = Padding(
      padding: EdgeInsets.only(top: 5),
      child: SizedBox(
        height: 50,
        width: 54,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.blueAccent,
            boxShadow: [
              BoxShadow(
                color: Color(0x5882B1FF),
                spreadRadius: 6,
                blurRadius: 10,
                offset: Offset(1, 5),
              )
            ],
          ),
          child: FittedBox(
            child: Icon(Icons.abc, color: AppTheme.gray100),
          ),
        ),
      ),
    );

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          IndexedStack(
            index: _currentIndex,
            children: const <Widget>[
              HomePage(),
              CategoryPage(),
              CartPage(),
              PersonPage()
            ],
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: MyBottomNavigationBar(
              children: [
                MyBottomTabItem(
                    icon: Icon(Icons.home),
                    label: "首页"
                ),
                MyBottomTabItem(
                    icon: Icon(Icons.category),
                    label: "分类"
                ),
                add,
                MyBottomTabItem(
                    icon: Icon(Icons.shopping_cart),
                    label: "购物车"
                ),
                MyBottomTabItem(
                    icon: Icon(Icons.account_circle),
                    label: "我的"
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}