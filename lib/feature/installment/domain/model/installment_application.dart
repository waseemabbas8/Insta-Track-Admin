class InstallmentApplication {
  final String name;
  final String phone;
  final String product;
  final int price;
  final String advance;
  final String createdAt;
  final bool? status;
  final int installmentsCount;

  InstallmentApplication({
    required this.name,
    required this.phone,
    required this.product,
    required this.price,
    required this.advance,
    required this.installmentsCount,
    required this.createdAt,
    this.status,
  });

  bool matchesSearchResult(String value) {
    final searchWord = value.toLowerCase();
    return name.toLowerCase().contains(searchWord) ||
        phone.toLowerCase().contains(searchWord) ||
        createdAt.toLowerCase().contains(searchWord);
  }
}

class UserInfo {
  final String fullName;
  final String phone;

  UserInfo(this.fullName, this.phone);
}

class ProductInfo {
  final String model;
  final String name;
  final int price;

  ProductInfo(this.model, this.name, this.price);
}

class InstallmentCount {
  final int paid;
  final int total;

  InstallmentCount(this.paid, this.total);
}
