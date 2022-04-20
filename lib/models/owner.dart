import 'package:json_annotation/json_annotation.dart';

part 'owner.g.dart';

@JsonSerializable()
class Owner {
  // final int id;
  String name, email, password, address, phone, photo;
  bool? isAvailable, isDeleted;

  Owner(
      {required this.name,
      required this.email,
      required this.password,
      required this.address,
      required this.phone,
      required this.photo,
      this.isAvailable,
      this.isDeleted});

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);


  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}
