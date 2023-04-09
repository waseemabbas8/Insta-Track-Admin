import '../../../../core/data/firebase/db/firestore_doc.dart';
import '../../domain/model/app_user.dart';

class UserApiModel extends FireStoreDoc {
  final String fullName;
  final String email;
  final String nic;
  final String? image;
  final String phone;
  final String city;
  final String address;
  final String? idFront;
  final String? idBack;
  final String createdAt;
  final String? updatedAt;
  final bool isActive;

  UserApiModel({
    required this.fullName,
    required this.email,
    required this.nic,
    required this.image,
    required this.phone,
    required this.city,
    required this.address,
    required this.idFront,
    required this.idBack,
    required this.createdAt,
    required this.isActive,
    this.updatedAt,
  });

  factory UserApiModel.fromMap(Map<String, dynamic> map) => UserApiModel(
        fullName: map['full_name'] as String,
        email: map['email'] as String,
        nic: map['cnic'] as String,
        image: map['profile'] as String?,
        phone: map['phone_num'] as String,
        city: map['city'] as String,
        address: map['address'] as String,
        idFront: map['id_front'] as String?,
        idBack: map['id_back'] as String?,
        createdAt: map['created_at'] as String,
        updatedAt: map['updated_at'] as String?,
        isActive: map['active'] as bool,
      );

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        'full_name': fullName,
        'email': email,
        'cnic': nic,
        'profile': image,
        'phone_num': phone,
        'city': city,
        'address': address,
        'id_front': idFront,
        'id_back': idBack,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'active': isActive,
      };

  AppUser toDto() => AppUser(
        id: docId!,
        name: fullName,
        email: email,
        nic: nic,
        image: image ?? 'https://picsum.photos/200',
        phone: phone,
        city: city,
        address: address,
        createdAt: createdAt,
        isActive: isActive,
      );
}
