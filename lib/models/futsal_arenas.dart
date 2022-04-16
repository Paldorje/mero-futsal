import 'package:json_annotation/json_annotation.dart';

part 'futsal_arenas.g.dart';

@JsonSerializable()
class FutsalArenas {
  String futsalName, location, ownerEmail;
  bool isReserved, isDeleted;

  // String img, color;
  int cost;

  FutsalArenas(this.futsalName, this.location, this.ownerEmail, this.cost,
      this.isReserved, this.isDeleted);

  factory FutsalArenas.fromJson(Map<String, dynamic> json) =>
      _$FutsalArenasFromJson(json);

  Map<String, dynamic> toJson() => _$FutsalArenasToJson(this);
}
