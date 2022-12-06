import 'package:flutter/material.dart';
import 'package:matgary/Widgets/app_drawer.dart';
import 'package:matgary/Widgets/order_item.dart';
import 'package:matgary/providers/orders.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Your Orders'),
      ),
      drawer: const AppDrawer(),
      body: SizedBox(
        height: mediaQuery.size.height,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return OrderItemWidget(order: ordersData.getOrders[index]);
          },
          itemCount: ordersData.getOrders.length,
        ),
      ),
    );
  }
}
