class UserInfo {
  final String fullName;
  final String phone;

  UserInfo({required this.fullName, required this.phone});

  factory UserInfo.fromMap(Map<String, dynamic> map) => UserInfo(
        fullName: map['full_name'] as String,
        phone: map['phone_num'] as String,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'full_name': fullName,
        'phone_num': phone,
      };
}
