// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String?,
      address: json['address'] as String,
      phone: json['phone'] as String,
      photo: json['photo'] as String,
      isAvailable: json['isAvailable'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
    )
      ..passwordHash = json['passwordHash'] as String?
      ..passwordSalt = json['passwordSalt'] as String?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'address': instance.address,
      'phone': instance.phone,
      'photo': instance.photo,
      'password': instance.password,
      'passwordHash': instance.passwordHash,
      'passwordSalt': instance.passwordSalt,
      'isAvailable': instance.isAvailable,
      'isDeleted': instance.isDeleted,
    };
