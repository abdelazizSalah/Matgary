/// This file is used to be the provider for the cart

import 'package:flutter/cupertino.dart';
import 'product.dart';
import '../data/products.dart';

/// here we try to separate as much logic as we can from the widgets themselves
/// so any logic should be implemented here and make a function that can implement
/// any thing we need instead of applying that logic inside the widget itself.
class ProductsProvider with ChangeNotifier {
  List<Product> myItems = myProducts;
  bool _showFavOnly = false;

  List<Product> get items {
    /// returning a copy of our list
    /// WE SHOULDN'T SEPARATE A LOGIC DEPENDING ON WHAT A WIDGET WANT, IF
    /// ONE WIDGET WANT TO CHANGE ITS CONTENT DEPENDING ON THE STATE
    ///  THEN IT SHOULD BE A STATEFULL WIDGET, HERE WE ARE WORKING FOR
    /// THE WHOLE APP NOT FOR CERTAIN WIDGET
    // if (_showFavOnly) {
    //   /// here we don't need to send a copy because toList already create a new
    //   /// list for us so it wont affect
    //   return myItems.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [...myItems];
  }

  List<Product> get favoriteItems {
    return myItems.where((product) => product.isFavorite).toList();
  }

  void showFavOnly() {
    _showFavOnly = true;
    notifyListeners();
  }

  void showAll() {
    _showFavOnly = false;
    notifyListeners();
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
