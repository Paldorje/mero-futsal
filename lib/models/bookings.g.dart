// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bookings _$BookingsFromJson(Map<String, dynamic> json) => Bookings(
      bookingId: json['bookingId'] as int,
      currentUserEmail: json['currentUserEmail'] as String,
      futsalId: json['futsalId'] as int,
      isDeleted: json['isDeleted'] as bool,
      bookedTime: json['bookedTime'] as String,
      bookingTime: DateTime.parse(json['bookingTime'] as String),
    );

Map<String, dynamic> _$BookingsToJson(Bookings instance) => <String, dynamic>{
      'bookingId': instance.bookingId,
      'futsalId': instance.futsalId,
      'currentUserEmail': instance.currentUserEmail,
      'bookedTime': instance.bookedTime,
      'isDeleted': instance.isDeleted,
      'bookingTime': instance.bookingTime.toIso8601String(),
    };
