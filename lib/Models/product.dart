class Product {
  final String id;
  final String title;
  final String description;
  final String imgURL; // network img
  bool isFavorite;

  Product(
      {required this.id,
      required this.title,
      required this.imgURL,
      required this.description,
      this.isFavorite = false

      /// we can just use the
      /// initializition to solve null safety
      });
}
