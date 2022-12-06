import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  static const routeName = '/product-detail-screen-route';
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    /// getting the id from the navigator
    final myID = ModalRoute.of(context)?.settings.arguments as String;

    /// checking on the loaded product that it is the same product as me.
    final loadedProduct = Provider.of<ProductsProvider>(context, listen: false)
        .findById(myID); // so this is called a listener

    /// .... we want to get all our data
    return Scaffold(
      appBar: AppBar(title: Text(loadedProduct.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: mediaQuery.size.height * 0.5,
              width: mediaQuery.size.width,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '\$${loadedProduct.price}',
              style: const TextStyle(color: Colors.amber, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: mediaQuery.size.width,
              padding: const EdgeInsets.all(10),
              child: Text(
                loadedProduct.description,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
