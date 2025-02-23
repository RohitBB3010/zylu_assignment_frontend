import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

part 'vehicles_model.g.dart';

@JsonSerializable()
class Vehicle {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  @JsonKey(name: 'manufacture_date')
  final DateTime manufactureDate;
  final int mileage;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Color? color;

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);

  Vehicle(
      {required this.id,
      required this.name,
      required this.manufactureDate,
      required this.mileage,
      this.color});
}
