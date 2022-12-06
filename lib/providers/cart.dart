import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.price,
      required this.quantity,
      required this.title});
}

class Cart with ChangeNotifier {
  late Map<String, CartItem> _items;

  get items {
    return {..._items};
  }

  void addItem(String productId, double price, String title) {
    /// check whethere this item exists before or not?
    /// if yes then we need to just increase the quantity
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existtingCartItem) => CartItem(
              id: existtingCartItem.id,
              price: existtingCartItem.price,
              quantity: existtingCartItem.quantity + 1,
              title: existtingCartItem.title));
    } else {
      _items.putIfAbsent(
          productId,
          (() => CartItem(
              id: productId, price: price, quantity: 1, title: title)));
    }
  }
}
