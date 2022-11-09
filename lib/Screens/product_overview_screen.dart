import 'package:flutter/material.dart';
import 'package:matgary/Widgets/product_item.dart';

import '../data/products.dart';

class ProductOverViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          itemCount: myProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (ctx, index) => ProductItem(myProducts[index].id,
              myProducts[index].imageUrl, myProducts[index].title)),
    );
  }
}
