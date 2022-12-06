import 'package:flutter/cupertino.dart';
import 'product.dart';
import '../data/products.dart';

/// here we try to separate as much logic as we can from the widgets themselves
/// so any logic should be implemented here and make a function that can implement
/// any thing we need instead of applying that logic inside the widget itself.
class ProductsProvider with ChangeNotifier {
  List<Product> myItems = myProducts;

  List<Product> get items {
    /// returning a copy of our list
    return [...myItems];
    // return [];
  }

  void addProduct(product) {
    // myItems.add(product);

    /// this is the method which is built in ChangeNotifier which is responsible
    /// for notifying the other listeners that something has changed
    /// this happens by creating a channel between the provider and the widgets
    /// which are interrested in the changes
    notifyListeners();
  }

  Product findById(String id) {
    return myItems.firstWhere((prod) => prod.id == id);
  }
}
