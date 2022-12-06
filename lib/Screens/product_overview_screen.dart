import 'package:flutter/material.dart';
import 'package:matgary/Screens/cart_screen.dart';
import 'package:matgary/Widgets/app_drawer.dart';
import 'package:matgary/Widgets/badge.dart';
import 'package:provider/provider.dart';
import '../Widgets/products_grid.dart';
import '../providers/cart.dart';
import '../providers/products_provider.dart';

class ProductOverViewScreen extends StatefulWidget {
  static const routeName = '/products-overview-screen';

  @override
  State<ProductOverViewScreen> createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverViewScreen> {
  bool showFavs = false;

  @override
  Widget build(BuildContext context) {
    /// it set a connection with one of the provider classes
    /// to can use it you must have a parent class which has a provider
    /// so by setting this statement, then you apply a listener which will rebuild
    /// only if something changes
    final productsData = Provider.of<ProductsProvider>(context,
        listen: false); // because (of) is a genaric method

    final products = productsData.items;

    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions option) {
              if (option == FilterOptions.all) {
                setState(() {
                  showFavs = false;
                });
              } else {
                setState(() {
                  showFavs = true;
                });
              }
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: FilterOptions.all,
                  child: Text('All'),
                ),
                const PopupMenuItem(
                  value: FilterOptions.isFavorites,
                  child: Text('Only Favorite'),
                ),
              ];
            },
          ),
          Consumer<Cart>(
            builder: (context, cartData, ch) => Badge(
              value: cartData.itemCount.toString(),
              color: Colors.redAccent,
              child: ch!,
            ),
            child: IconButton(
              // we separated this here because it doesn't change at all so rerendering it is a kind of waste
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          )
        ],
        centerTitle: true,
        title: Text(
          'MyShop',
          style: Theme.of(context).textTheme.titleLarge,
        ),

        /// to be filled
      ),
      drawer: const AppDrawer(),
      body: ProductGrid(showFavs),
    );
  }
}
