import "package:flutter/material.dart";

import "../../utils/colors.dart";
import "../cart/cart_page.dart";
import "../shop/shop_page.dart";
import "widgets/bottom_bar.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Tab Index
  int _tabIndex = 0;
  void changeIndex(value) {
    setState(() {
      _tabIndex = value;
    });
  }

  // Pages
  final List<Widget> _pages = const [
    ShopPage(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: BottomBar(
        onTabChange: (index) {
          changeIndex(index);
        },
      ),
      body: _pages[_tabIndex],
    );
  }
}
