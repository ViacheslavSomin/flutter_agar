import 'package:flutter/foundation.dart';
import 'package:flutter_agar/src/entities/cells/alien_cell.dart';
import 'package:flutter_agar/src/entities/cells/my_cell.dart';

import 'package:flutter_agar/src/entities/food.dart';
import 'package:json_annotation/json_annotation.dart';

part 'map_state.g.dart';

@JsonSerializable()
class MapState {
  MapState({
    required this.gameTick,
    required this.myCells,
    required this.alienCells,
    required this.food,
  });

  final num gameTick;
  final List<MyCell> myCells;
  final List<AlienCell> alienCells;
  final List<Food> food;

  factory MapState.fromJson(Map<String, dynamic> json) =>
      _$MapStateFromJson(json);

  Map<String, dynamic> toJson() => _$MapStateToJson(this);

  @override
  String toString() {
    return 'MapState(gameTick: $gameTick, myCells: $myCells, alienCells: $alienCells, food: $food)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MapState &&
        other.gameTick == gameTick &&
        listEquals(other.myCells, myCells) &&
        listEquals(other.alienCells, alienCells) &&
        listEquals(other.food, food);
  }

  @override
  int get hashCode {
    return gameTick.hashCode ^
        myCells.hashCode ^
        alienCells.hashCode ^
        food.hashCode;
  }
}
