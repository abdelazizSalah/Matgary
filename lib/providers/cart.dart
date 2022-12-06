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
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
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
    notifyListeners();
  }

  int get itemCount {
    return _items.isEmpty ? 0 : _items.length;
  }

  /// this function is responsible for returnning the total amount of money that
  /// the user should pay depending on how many items he want multiplied by thier
  /// prices.
  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }
}
