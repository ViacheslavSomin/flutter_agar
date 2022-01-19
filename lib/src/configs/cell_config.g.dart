// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cell_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CellConfig _$CellConfigFromJson(Map json) => CellConfig(
      minMass: (json['minMass'] as num).toDouble(),
      maxMass: (json['maxMass'] as num).toDouble(),
      minSpeed: (json['minSpeed'] as num).toDouble(),
      maxSpeed: (json['maxSpeed'] as num).toDouble(),
      volatilization: (json['volatilization'] as num).toDouble(),
    );

Map<String, dynamic> _$CellConfigToJson(CellConfig instance) =>
    <String, dynamic>{
      'minMass': instance.minMass,
      'maxMass': instance.maxMass,
      'minSpeed': instance.minSpeed,
      'maxSpeed': instance.maxSpeed,
      'volatilization': instance.volatilization,
    };
