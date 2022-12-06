import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItemWidget extends StatelessWidget {
  final String productId;
  final String id;
  final String title;
  final double price;
  final int quantity;
  const CartItemWidget({
    super.key,
    required this.productId,
    required this.id,
    required this.price,
    required this.title,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: Key(id),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Center(child: Text('Delete')),
                Icon(
                  Icons.delete_forever,
                  size: 40,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
      onDismissed: ((direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      }),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              // backgroundColor: Theme.of(context).colorScheme.whit,
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black87,
              radius: 40,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: FittedBox(
                    child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    '\$ $price',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                )),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total: \$ ${price * quantity}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
