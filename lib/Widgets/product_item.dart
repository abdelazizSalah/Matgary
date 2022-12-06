import 'package:flutter/material.dart';
import 'package:matgary/Screens/product_detail_screen.dart';
import 'package:matgary/providers/products_provider.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Helo');
    final product = Provider.of<Product>(context,

        /// if we set listen to false we will no longer
        /// see the changes if we pressed on the heart icon
        listen: false);
    final mediaQuery = MediaQuery.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        footer: SizedBox(
          height: 50,
          child: GridTileBar(
            backgroundColor: Colors.black54,
            leading: Consumer<Product>(
              builder: (context, value, child) => IconButton(
                tooltip: 'Favorite it!',
                icon: Icon(
                  Icons.favorite,
                  color: product.isFavorite ? Colors.red : Colors.red[100],
                ),
                onPressed: () {
                  product.toggleFavoriteStatus();
                },
              ),
            ),
            title: SizedBox(
              height: mediaQuery.size.height * 0.1,
              child: FittedBox(
                child: Text(
                  product.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            trailing: IconButton(
              tooltip: 'Let\'s buy it!!',
              icon: Icon(
                Icons.shopify_sharp,
                color: Colors.amber[100],
              ),
              onPressed: () {},
            ),
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
