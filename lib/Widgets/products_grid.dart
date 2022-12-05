import 'package:flutter/material.dart';
import 'package:matgary/providers/products_provider.dart';
import './product_item.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// it set a connection with one of the provider classes
    /// to can use it you must have a parent class which has a provider
    /// so by setting this statement, then you apply a listener which will rebuild
    /// only if something changes
    final productsData = Provider.of<ProductsProvider>(
        context); // because (of) is a genaric method

    final products = productsData.items;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'MyShop',
          style: Theme.of(context).textTheme.titleLarge,
        ),

        /// to be filled
      ),
      drawer: const Drawer(),
      body: GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (ctx, index) => ProductItem(products[index].id,
              products[index].imageUrl, products[index].title)),
    );
  }
}
