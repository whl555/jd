import 'package:flutter/material.dart';
import 'package:jd/pages/cart.dart';
import 'package:jd/pages/category.dart';
import 'package:jd/pages/home.dart';
import 'package:jd/pages/person.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
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
            setState(() => {
              _currentIndex = index
            })
          },
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: const <Widget>[
            HomePage(),
            CategoryPage(),
            CartPage(),
            PersonPage()
        ],
      ),
    );
  }
}