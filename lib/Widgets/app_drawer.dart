import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:matgary/Screens/orders_screen.dart';
import 'package:matgary/Screens/product_overview_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Here is Your Settings'),
            automaticallyImplyLeading:
                false, // this disallow flutter to put the back button even if we need it
          ),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.shop),
              title: const Text('Shop'),
              onTap: (() {
                Navigator.of(context)
                    .pushReplacementNamed(ProductOverViewScreen.routeName);
              })),
          ListTile(
              leading: const Icon(Icons.add_task),
              title: const Text('orders'),
              onTap: (() {
                Navigator.of(context)
                    .pushReplacementNamed(OrdersScreen.routeName);
              })),
        ],
      ),
    );
  }
}
