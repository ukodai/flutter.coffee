import "package:coffee/models/coffee_model.dart";
import "package:coffee/pages/shop/widgets/show_coffee.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../../models/shop_model.dart";

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // Add to Cart
  void addToCart(CoffeeModel coffee) {
    Provider.of<ShopModel>(context, listen: false).addToCart(coffee);
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.brown,
          title: Text(
            "Added to Cart",
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopModel>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const Text(
                "How would you like to your coffee?",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: ListView.builder(
                  itemCount: value.shop.length,
                  itemBuilder: (context, index) {
                    CoffeeModel coffee = value.shop[index];
                    return ShowCoffee(
                      coffee: coffee,
                      onPressed: () => addToCart(coffee),
                      icon: const Icon(Icons.add),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
