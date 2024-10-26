import 'package:ecommerce_app/components/my_drawer.dart';
import 'package:ecommerce_app/components/my_product_tile.dart';
import 'package:ecommerce_app/provider/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Shop Page"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/cart_page");
              },
              icon: const Icon(Icons.shopping_cart_checkout),
            ),
          ],
        ),
        drawer: const Drawer(
          child: MyDrawer(),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            Center(
              child: Text(
                "Pick from a selected list of premium products",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 500,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: value.getShop().length,
                itemBuilder: (BuildContext context, int index) {
                  Product product = value.getShop()[index];
                  return MyProductTile(product: product);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
