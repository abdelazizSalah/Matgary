class Product {
  final String id;
  final String title;
  final String description;
  final String imageUrl; // network img
  final double price;
  bool isFavorite;

  Product(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.price,
      required this.description,
      this.isFavorite = false

      /// we can just use the
      /// initializition to solve null safety
      });
}
