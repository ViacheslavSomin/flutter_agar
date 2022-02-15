// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameConfig _$GameConfigFromJson(Map json) => GameConfig(
      tickTime: (json['tickTime'] as num).toDouble(),
      tickLimit: (json['tickLimit'] as num).toDouble(),
      cellConfig: CellConfig.fromJson(
          Map<String, dynamic>.from(json['cellConfig'] as Map)),
      mapConfig: MapConfig.fromJson(
          Map<String, dynamic>.from(json['mapConfig'] as Map)),
      foodConfig: FoodConfig.fromJson(
          Map<String, dynamic>.from(json['foodConfig'] as Map)),
    );

Map<String, dynamic> _$GameConfigToJson(GameConfig instance) =>
    <String, dynamic>{
      'tickTime': instance.tickTime,
      'tickLimit': instance.tickLimit,
      'cellConfig': instance.cellConfig.toJson(),
      'mapConfig': instance.mapConfig.toJson(),
      'foodConfig': instance.foodConfig.toJson(),
    };
