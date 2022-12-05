import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  static const routeName = '/product-detail-screen-route';
  @override
  Widget build(BuildContext context) {
    /// getting the id from the navigator
    final myID = ModalRoute.of(context)?.settings.arguments as String;

    /// checking on the loaded product that it is the same product as me.
    final loadedProduct = Provider.of<ProductsProvider>(context, listen: false)
        .findById(myID); // so this is called a listener

    /// .... we want to get all our data
    return Scaffold(
      appBar: AppBar(title: Text(loadedProduct.title)),
      body: Center(child: Text(loadedProduct.title)),
    );
  }
}
