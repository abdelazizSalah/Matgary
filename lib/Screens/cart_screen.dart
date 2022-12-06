import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/cart_item.dart';
import '../providers/cart.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: Column(children: [
        Card(
          margin: const EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Chip(
                    label: Text('\$${cartData.totalAmount}'),
                    backgroundColor: Theme.of(context).colorScheme.surface,
                  ),
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blueGrey)),
                      onPressed: () {},
                      child: const Text(
                        'Order Now',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ))
                ]),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              final myList = cartData.items.values.toList();
              return CartItemWidget(
                  productId: cartData.items.keys.toList()[index],
                  id: myList[index].id,
                  price: myList[index].price,
                  quantity: myList[index].quantity,
                  title: myList[index].title);
            },
            itemCount: cartData.itemCount,
          ),
        )
      ]),
    );
  }
}
