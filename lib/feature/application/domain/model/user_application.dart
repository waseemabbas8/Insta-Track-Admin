import '../../../auth/domain/model/User.dart';

class UserApplication extends User {
  final String phone;
  final String product;
  final String advanceAmount;
  final String createdAt;
  final bool? status;
  final int installments;

  UserApplication({
    required super.id,
    required super.name,
    required super.email,
    required this.phone,
    required this.product,
    required this.advanceAmount,
    required this.installments,
    required this.createdAt,
    this.status,
  });

  bool matchesSearchResult(String value) {
    final searchWord = value.toLowerCase();
    return name.toLowerCase().contains(searchWord) ||
        email.toLowerCase().contains(searchWord) ||
        phone.toLowerCase().contains(searchWord) ||
        createdAt.toLowerCase().contains(searchWord);
  }
}
