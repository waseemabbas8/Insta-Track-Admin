import '../../../auth/domain/model/User.dart';

class AppUser extends User {
  final String nic;
  final String image;
  final String phone;
  final String city;
  final String address;
  final String createdAt;
  final bool isActive;

  AppUser({
    required super.id,
    required super.name,
    required super.email,
    required this.nic,
    required this.phone,
    required this.city,
    required this.address,
    required this.createdAt,
    required this.isActive,
    this.image = 'https://picsum.photos/200',
  });

  bool matchesSearchResult(String value) {
    final searchWord = value.toLowerCase();
    return name.toLowerCase().contains(searchWord) ||
        email.toLowerCase().contains(searchWord) ||
        nic.toLowerCase().contains(searchWord) ||
        phone.toLowerCase().contains(searchWord) ||
        city.toLowerCase().contains(searchWord) ||
        address.toLowerCase().contains(searchWord) ||
        createdAt.toLowerCase().contains(searchWord);
  }
}
