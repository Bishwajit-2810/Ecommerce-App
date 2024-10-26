import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
      name: "Product 1",
      price: "99.99",
      description: "A very good product 1",
      imagePath: Icons.radio,
    ),
    Product(
      name: "Product 2",
      price: "99.98",
      description: "A very good product 2",
      imagePath: Icons.tv,
    ),
    Product(
      name: "Product 3",
      price: "99.97",
      description: "A very good product 3",
      imagePath: Icons.access_alarms_outlined,
    ),
    Product(
      name: "Product 4",
      price: "99.96",
      description: "A very good product 4",
      imagePath: Icons.battery_0_bar,
    ),
    Product(
        name: "Product 5",
        price: "99.95",
        description: "A very good product 5",
        imagePath: Icons.logo_dev),
    Product(
      name: "Product 6",
      price: "99.94",
      description: "A very good product 6",
      imagePath: Icons.print_rounded,
    ),
  ];

  final List<Product> _cart = [];

  List<Product> getShop() {
    return _shop;
  }

  List<Product> getCart() {
    return _cart;
  }

  void addInCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }
}
