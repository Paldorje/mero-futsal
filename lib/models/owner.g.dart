// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
      photo: json['photo'] as String,
      isAvailable: json['isAvailable'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'address': instance.address,
      'phone': instance.phone,
      'photo': instance.photo,
      'isAvailable': instance.isAvailable,
      'isDeleted': instance.isDeleted,
    };
