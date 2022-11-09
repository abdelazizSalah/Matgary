import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  static const routeName = '/product-detail-screen-route';
  @override
  Widget build(BuildContext context) {
    final myID = ModalRoute.of(context)?.settings.arguments as String;

    /// .... we want to get all our data
    return Scaffold(
      appBar: AppBar(title: Text('myTitle')),
    );
  }
}
