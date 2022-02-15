// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cell_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CellConfig _$CellConfigFromJson(Map json) => CellConfig(
      massToRadius: (json['massToRadius'] as num).toDouble(),
      toEatDiff: (json['toEatDiff'] as num).toDouble(),
      collisionOffset: (json['collisionOffset'] as num).toDouble(),
      minEatEfficiency: (json['minEatEfficiency'] as num).toDouble(),
      maxEatEfficiency: (json['maxEatEfficiency'] as num).toDouble(),
      energyToEatEfficiency: (json['energyToEatEfficiency'] as num).toDouble(),
      minMass: (json['minMass'] as num).toDouble(),
      maxMass: (json['maxMass'] as num).toDouble(),
      energyToMass: (json['energyToMass'] as num).toDouble(),
      minSpeed: (json['minSpeed'] as num).toDouble(),
      maxSpeed: (json['maxSpeed'] as num).toDouble(),
      energyToMaxSpeed: (json['energyToMaxSpeed'] as num).toDouble(),
      minPower: (json['minPower'] as num).toDouble(),
      maxPower: (json['maxPower'] as num).toDouble(),
      energyToPower: (json['energyToPower'] as num).toDouble(),
      maxVolatilization: (json['maxVolatilization'] as num).toDouble(),
      minVolatilization: (json['minVolatilization'] as num).toDouble(),
      energyToVolatilization:
          (json['energyToVolatilization'] as num).toDouble(),
    );

Map<String, dynamic> _$CellConfigToJson(CellConfig instance) =>
    <String, dynamic>{
      'massToRadius': instance.massToRadius,
      'toEatDiff': instance.toEatDiff,
      'collisionOffset': instance.collisionOffset,
      'minEatEfficiency': instance.minEatEfficiency,
      'maxEatEfficiency': instance.maxEatEfficiency,
      'energyToEatEfficiency': instance.energyToEatEfficiency,
      'minMass': instance.minMass,
      'maxMass': instance.maxMass,
      'energyToMass': instance.energyToMass,
      'minSpeed': instance.minSpeed,
      'maxSpeed': instance.maxSpeed,
      'energyToMaxSpeed': instance.energyToMaxSpeed,
      'minPower': instance.minPower,
      'maxPower': instance.maxPower,
      'energyToPower': instance.energyToPower,
      'maxVolatilization': instance.maxVolatilization,
      'minVolatilization': instance.minVolatilization,
      'energyToVolatilization': instance.energyToVolatilization,
    };
