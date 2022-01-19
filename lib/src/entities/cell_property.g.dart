// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cell_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CellProperty _$CellPropertyFromJson(Map json) => CellProperty(
      mass: (json['mass'] as num).toDouble(),
      radius: (json['radius'] as num).toDouble(),
      speed: (json['speed'] as num).toDouble(),
      position:
          Position.fromJson(Map<String, dynamic>.from(json['position'] as Map)),
      velocity:
          Velocity.fromJson(Map<String, dynamic>.from(json['velocity'] as Map)),
      eatEfficiency: (json['eatEfficiency'] as num).toDouble(),
    );

Map<String, dynamic> _$CellPropertyToJson(CellProperty instance) =>
    <String, dynamic>{
      'mass': instance.mass,
      'radius': instance.radius,
      'speed': instance.speed,
      'position': instance.position.toJson(),
      'velocity': instance.velocity.toJson(),
      'eatEfficiency': instance.eatEfficiency,
    };
