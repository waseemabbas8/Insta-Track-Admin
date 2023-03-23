import '../../../auth/domain/model/User.dart';

class AppUser extends User {
  final String nic;
  final String image;
  final String phone;
  final String city;
  final String address;
  final String createdAt;

  AppUser({
    required super.id,
    required super.name,
    required super.email,
    required this.nic,
    required this.image,
    required this.phone,
    required this.city,
    required this.address,
    required this.createdAt,
  });
}
