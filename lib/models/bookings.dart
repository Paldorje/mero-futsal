import 'package:json_annotation/json_annotation.dart';

part 'bookings.g.dart';

@JsonSerializable()
class Bookings {
  int? bookingId;
  int? futsalId;
  String currentUserEmail, bookedTime;
  bool? isDeleted;
  DateTime bookingTime;

  Bookings(
      {
        required this.bookingId,
        required this.currentUserEmail,
        required this.futsalId,
        required this.isDeleted,
        required this.bookedTime,
        required this.bookingTime,
        });

  factory Bookings.fromJson(Map<String, dynamic> json) => _$BookingsFromJson(json);

  Map<String, dynamic> toJson() => _$BookingsToJson(this);
}
