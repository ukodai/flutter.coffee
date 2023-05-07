import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../../models/coffee_model.dart";
import "../../models/shop_model.dart";
import "../shop/widgets/show_coffee.dart";

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Remove from Cart
  void removeFromCart(CoffeeModel coffee) {
    Provider.of<ShopModel>(context, listen: false).removeFromCart(coffee);
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.brown,
          title: Text(
            "Removed from Cart",
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  //  Pay Now
  void payNow() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.brown,
          title: Text(
            "Payment Successful",
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
              // Heading
              const Text("Your Cart", style: TextStyle(fontSize: 20)),
              // Cart Items List
              Expanded(
                child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (BuildContext context, int index) {
                    CoffeeModel coffee = value.cart[index];
                    return ShowCoffee(
                      coffee: coffee,
                      onPressed: () {
                        removeFromCart(coffee);
                      },
                      icon: const Icon(Icons.delete),
                    );
                  },
                ),
              ),
              //  Pay Button
              GestureDetector(
                onTap: payNow,
                child: Container(
                  padding: const EdgeInsets.all(25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      "Pay Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
