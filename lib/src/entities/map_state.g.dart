// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapState _$MapStateFromJson(Map json) => MapState(
      gameTick: json['gameTick'] as num,
      myCells: (json['myCells'] as List<dynamic>)
          .map((e) => MyCell.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      alienCells: (json['alienCells'] as List<dynamic>)
          .map((e) => AlienCell.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      food: (json['food'] as List<dynamic>)
          .map((e) => Food.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$MapStateToJson(MapState instance) => <String, dynamic>{
      'gameTick': instance.gameTick,
      'myCells': instance.myCells.map((e) => e.toJson()).toList(),
      'alienCells': instance.alienCells.map((e) => e.toJson()).toList(),
      'food': instance.food.map((e) => e.toJson()).toList(),
    };
