// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'futsal_arenas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FutsalArenas _$FutsalArenasFromJson(Map<String, dynamic> json) => FutsalArenas(
      json['futsalName'] as String,
      json['location'] as String,
      json['ownerEmail'] as String,
      json['cost'] as int,
      json['isReserved'] as bool,
      json['isDeleted'] as bool,
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
