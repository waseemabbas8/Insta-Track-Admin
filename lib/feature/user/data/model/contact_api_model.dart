import '../../domain/model/contact.dart';

class ContactApiModel {
  final String name;
  final String phone;

  ContactApiModel({required this.name, required this.phone});

  factory ContactApiModel.fromMap(Map<String, dynamic> map) => ContactApiModel(
    name: map['displayName'] as String,
    phone: map['phoneNumber'] as String,
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    'displayName': name,
    'phoneNumber': phone,
  };

  Contact toDto() => Contact(
    name: name,
    phone: phone,
  );
}