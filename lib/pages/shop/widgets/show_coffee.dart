// ignore_for_file: must_be_immutable

import "package:flutter/material.dart";

import "../../../models/coffee_model.dart";

class ShowCoffee extends StatelessWidget {
  final CoffeeModel coffee;
  void Function()? onPressed;
  final Widget icon;
  ShowCoffee({
    super.key,
    required this.coffee,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      child: ListTile(
        title: Text(coffee.name),
        subtitle: Text("\$${coffee.price}"),
        leading: Image.asset(coffee.image),
        trailing: IconButton(
          onPressed: onPressed,
          icon: icon,
        ),
      ),
    );
  }
}
