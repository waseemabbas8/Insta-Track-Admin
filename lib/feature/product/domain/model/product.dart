class Product {
  final String id;
  final String name;
  final String model;
  final int price;

  Product({required this.id, required this.name, required this.model, required this.price});

  bool matchesSearchResult(String value) {
    final searchWord = value.toLowerCase();
    return name.toLowerCase().contains(searchWord) ||
        model.toLowerCase().contains(searchWord) ||
        price.toString().toLowerCase().contains(searchWord);
  }
}