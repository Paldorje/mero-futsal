import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  // final int id;
  String name, email, address, phone, photo;
  String? password, passwordHash, passwordSalt;
  bool? isAvailable, isDeleted;

  User(
      {required this.name,
      required this.email,
      required this.password,
      required this.address,
      required this.phone,
      required this.photo,
      this.isAvailable,
      this.isDeleted});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
