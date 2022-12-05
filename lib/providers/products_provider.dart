import 'package:flutter/cupertino.dart';
import '../Models/product.dart';
import '../data/products.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = myProducts;

  List<Product> get items {
    /// returning a copy of our list
    return [..._items];
    // return [];
  }

  void addProduct(product) {
    // _items.add(product);

    /// this is the method which is built in ChangeNotifier which is responsible
    /// for notifying the other listeners that something has changed
    /// this happens by creating a channel between the provider and the widgets
    /// which are interrested in the changes
    notifyListeners();
  }
}
