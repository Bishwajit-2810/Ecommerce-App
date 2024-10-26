import 'package:ecommerce_app/components/my_button.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/provider/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_drawer.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  void removeFromCart(BuildContext context, Product item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Remove this item from your cart"),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().removeFromCart(item);
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> cart = context.watch<Shop>().getCart();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cart Page"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/shop_page");
            },
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      drawer: const Drawer(
        child: MyDrawer(),
      ),
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
                ? const Center(
                    child: Text("Your cart is empty.."),
                  )
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Product item = cart[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.price),
                        trailing: IconButton(
                          onPressed: () => removeFromCart(context, item),
                          icon: const Icon(
                            Icons.remove,
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: MyButton(
              onTap: () {
                payNow(context);
              },
              child: const Text("PAY NOW"),
            ),
          ),
        ],
      ),
    );
  }

  void payNow(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text("User wants to pay"),
      ),
    );
  }
}
