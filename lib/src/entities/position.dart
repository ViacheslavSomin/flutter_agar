import 'dart:math';

import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_agar/src/entities/velocity.dart';

part 'position.g.dart';

@JsonSerializable()
class Position {
  Position({
    required this.x,
    required this.y,
  });

  final num x;
  final num y;

  double distanceTo(Position target) => _distanceBetweenPositions(
        position1: this,
        position2: target,
      );

  Velocity moveTo(Position? target) {
    return target != null ? moveToPosition(target) : Velocity.zero();
  }

  Velocity moveToPosition(Position target) {
    return Velocity(
      x: target.x - x,
      y: target.y - y,
    );
  }

  double _distanceBetweenPositions({
    required Position position1,
    required Position position2,
  }) =>
      sqrt(
        pow(position2.x - position1.x, 2) + pow(position2.y - position1.y, 2),
      );

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);

  Map<String, dynamic> toJson() => _$PositionToJson(this);

  @override
  String toString() => 'Position(x: $x, y: $y)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Position && other.x == x && other.y == y;
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}
