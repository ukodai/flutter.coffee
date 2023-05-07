import "package:coffee/models/shop_model.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "pages/home/home_page.dart";

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ShopModel(),
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    ),
  );
}
