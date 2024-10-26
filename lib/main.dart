import 'package:ecommerce_app/pages/cart_page.dart';
import 'package:ecommerce_app/provider/shop.dart';
import 'package:ecommerce_app/pages/shop_page.dart';
import 'package:ecommerce_app/provider/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Shop(),
          ),
          ChangeNotifierProvider(
            create: (context) => ThemeController(),
          ),
        ],
        builder: (context, child) {
          final provider = Provider.of<ThemeController>(context);
          return MaterialApp(
            theme: provider.getTheme(),
            debugShowCheckedModeBanner: false,
            routes: {
              "/intro_page": (context) => const IntroPage(),
              "/shop_page": (context) => const ShopPage(),
              "/cart_page": (context) => const CartPage(),
            },
            home: const IntroPage(),
          );
        });
  }
}
