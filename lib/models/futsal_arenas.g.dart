// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'futsal_arenas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FutsalArenas _$FutsalArenasFromJson(Map<String, dynamic> json) => FutsalArenas(
      futsalName: json['futsalName'] as String,
      location: json['location'] as String,
      ownerEmail: json['ownerEmail'] as String,
      cost: json['cost'] as int,
      isReserved: json['isReserved'] as bool,
      isDeleted: json['isDeleted'] as bool,
    );

Map<String, dynamic> _$FutsalArenasToJson(FutsalArenas instance) =>
    <String, dynamic>{
      'futsalName': instance.futsalName,
      'location': instance.location,
      'ownerEmail': instance.ownerEmail,
      'isReserved': instance.isReserved,
      'isDeleted': instance.isDeleted,
      'cost': instance.cost,
    };
