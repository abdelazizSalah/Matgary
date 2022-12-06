import 'package:flutter/material.dart';
import 'package:matgary/providers/products_provider.dart';
import './product_item.dart';
import 'package:provider/provider.dart';

enum FilterOptions { isFavorites, all }

class ProductGrid extends StatelessWidget {
  final bool showFavs;
  ProductGrid(this.showFavs);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context,
        listen: false); // because (of) is a genaric method

    final products =
        this.showFavs ? productsData.favoriteItems : productsData.items;

    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
              // here we are just returning the item itself
              value: products[index],
              child: ProductItem(),
            ));
  }
}
