class ProductInfo {
  final String model;
  final String name;
  final int price;

  ProductInfo({required this.model, required this.name, required this.price});

  factory ProductInfo.fromMap(Map<String, dynamic> map) => ProductInfo(
        name: map['model'] as String,
        model: map['name'] as String,
        price: map['price'] as int,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'model': name,
        'name': model,
        'price': price,
      };
}
