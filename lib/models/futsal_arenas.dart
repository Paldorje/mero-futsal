import 'package:json_annotation/json_annotation.dart';

part 'futsal_arenas.g.dart';

@JsonSerializable()
class FutsalArenas {
  String futsalName, location, ownerEmail;
  bool isReserved, isDeleted;

  // String img, color;
  int cost;

  FutsalArenas({required this.futsalName, required this.location, required this.ownerEmail, required this.cost,
      required this.isReserved, required this.isDeleted});

  factory FutsalArenas.fromJson(Map<String, dynamic> json) =>
      _$FutsalArenasFromJson(json);

  Map<String, dynamic> toJson() => _$FutsalArenasToJson(this);
}
