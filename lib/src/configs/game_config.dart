import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_agar/src/configs/cell_config.dart';
import 'package:flutter_agar/src/configs/food_config.dart';
import 'package:flutter_agar/src/configs/map_config.dart';

part 'game_config.g.dart';

@JsonSerializable()
class GameConfig {
  GameConfig({
    required this.tickTime,
    required this.tickLimit,
    required this.cellConfig,
    required this.mapConfig,
    required this.foodConfig,
  });

  final num tickTime;
  final num tickLimit;
  final CellConfig cellConfig;
  final MapConfig mapConfig;
  final FoodConfig foodConfig;

  factory GameConfig.fromJson(Map<String, dynamic> json) =>
      _$GameConfigFromJson(json);

  Map<String, dynamic> toJson() => _$GameConfigToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GameConfig &&
        other.tickTime == tickTime &&
        other.tickLimit == tickLimit &&
        other.cellConfig == cellConfig &&
        other.mapConfig == mapConfig &&
        other.foodConfig == foodConfig;
  }

  @override
  int get hashCode {
    return tickTime.hashCode ^
        tickLimit.hashCode ^
        cellConfig.hashCode ^
        mapConfig.hashCode ^
        foodConfig.hashCode;
  }

  @override
  String toString() {
    return 'GameConfig(tickTime: $tickTime, tickLimit: $tickLimit, cellConfig: $cellConfig, mapConfig: $mapConfig, foodConfig: $foodConfig)';
  }
}
