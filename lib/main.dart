import 'package:flutter/material.dart';
import 'package:matgary/Screens/product_detail_screen.dart';
import 'package:matgary/providers/cart.dart';
import 'package:provider/provider.dart';

import 'Screens/product_overview_screen.dart';
import 'providers/products_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// this widget is used by the provider package which is recommended
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
            // to be filled

            /// colors
            colorScheme: const ColorScheme(
              primary: Color.fromARGB(255, 255, 191, 0),
              onPrimary: Colors.amber,
              secondary: Colors.purple,
              onSecondary: Colors.white,
              background: Colors.grey,
              onBackground: Colors.amber,
              error: Colors.amber,
              onError: Colors.amber,
              onSurface: Colors.black,
              surface: Color.fromARGB(255, 231, 173, 0),
              brightness: Brightness.dark,
            ),

            /// text Theming
            fontFamily: 'Lato',
            textTheme: TextTheme(
                titleLarge: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(255, 6, 0, 8),
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 200,
                      )
                    ]),
                bodyLarge: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    overflow: TextOverflow.visible,
                    color: Colors.amber[500]))),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          ProductDetailScreen.routeName: (context) =>
              const ProductDetailScreen(),
        },
        home: ProductOverViewScreen(),
      ),
    );
  }
}
