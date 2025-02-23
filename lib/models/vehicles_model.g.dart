// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicles_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vehicle _$VehicleFromJson(Map<String, dynamic> json) => Vehicle(
      id: json['_id'] as String,
      name: json['name'] as String,
      manufactureDate: DateTime.parse(json['manufacture_date'] as String),
      mileage: (json['mileage'] as num).toInt(),
    );

Map<String, dynamic> _$VehicleToJson(Vehicle instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'manufacture_date': instance.manufactureDate.toIso8601String(),
      'mileage': instance.mileage,
    };
