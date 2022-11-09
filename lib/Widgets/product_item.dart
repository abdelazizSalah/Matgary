import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(this.id, this.imageURL, this.title, {super.key});
  final String id, title, imageURL;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        footer: SizedBox(
          height: 50,
          child: GridTileBar(
            backgroundColor: Colors.black54,
            leading: IconButton(
              tooltip: 'Favorite it!',
              icon: Icon(
                Icons.favorite,
                color: Colors.red[100],
              ),
              onPressed: () {},
            ),
            title: SizedBox(
              height: mediaQuery.size.height * 0.1,
              child: FittedBox(
                child: Text(
                  title,
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
            Navigator.of(context).pushNamed('routeName', arguments: {'ID': id});
          },
          child: Image.network(
            imageURL,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
