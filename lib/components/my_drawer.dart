import 'package:ecommerce_app/components/my_list_tile.dart';
import 'package:ecommerce_app/provider/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeController>(context);

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.shopping_bag,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  size: 72,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              MyListTile(
                icon: Icons.home,
                title: "Home",
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/shop_page");
                },
              ),
              MyListTile(
                icon: Icons.shopping_cart,
                title: "Cart",
                onTap: () {
                  Navigator.of(context);
                  Navigator.pushNamed(context, "/cart_page");
                },
              ),
              MyListTile(
                icon: Icons.lightbulb_circle,
                title: "Theme",
                onTap: () {
                  provider.toggleTheme();
                },
              ),
              Switch(
                value: provider.isDarkTheme(),
                onChanged: (enabled) {
                  if (enabled) {
                    provider.darkThemeSel();
                  } else {
                    provider.lightThemeSel();
                  }
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              icon: Icons.logout,
              title: "Exit",
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/intro_page");
              },
            ),
          ),
        ],
      ),
    );
  }
}
