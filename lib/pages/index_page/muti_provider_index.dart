import 'package:flutter/material.dart';
import 'package:jd/pages/cart.dart';
import 'package:jd/pages/category.dart';
import 'package:jd/pages/home.dart';
import 'package:jd/pages/person.dart';
import 'package:jd/providers/bottom_navi_provider.dart';
import 'package:provider/provider.dart';

class MultiIndex extends StatefulWidget {
  const MultiIndex({Key? key}) : super(key: key);

  @override
  State<MultiIndex> createState() => _MultiIndexState();
}

class _MultiIndexState extends State<MultiIndex> {
  // int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Consumer<BottomNaviIndex>(
          builder: (_, mProvider, __) =>
              BottomNavigationBar(
                currentIndex: mProvider.currentIndex,
                type: BottomNavigationBarType.fixed,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: "首页"
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.category),
                      label: "分类"
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart),
                      label: "购物车"
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle),
                      label: "我的"
                  )
                ],
                onTap: (index) => {
                // setState(() => {
                //   _currentIndex = index
                // })
                mProvider.changeCurrentIndex(index)
              },
              )
      ),
      body: Consumer<BottomNaviIndex>(
        builder: (_, mProvider, ___) =>
            IndexedStack(
              index: mProvider.currentIndex,
              children: const <Widget>[
                HomePage(),
                CategoryPage(),
                CartPage(),
                PersonPage()
              ],
            ),
      ),
    );
  }
}
