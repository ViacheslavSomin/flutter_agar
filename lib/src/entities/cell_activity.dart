import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_agar/src/entities/grow_intention.dart';
import 'package:flutter_agar/src/entities/move_action.dart';
import 'package:flutter_agar/src/entities/velocity.dart';

part 'cell_activity.g.dart';

@JsonSerializable()
class CellActivity {
  CellActivity({
    required this.cellId,
    required this.speed,
    this.velocity,
    this.growIntention,
    this.additionalAction,
  });

  final String cellId;
  final double speed;
  final Velocity? velocity;
  final GrowIntention? growIntention;

  @JsonKey(toJson: _moveActionToJson, fromJson: _moveActionFromJson)
  final MoveAction? additionalAction;

  factory CellActivity.fromJson(Map<String, dynamic> json) =>
      _$CellActivityFromJson(json);

  Map<String, dynamic> toJson() => _$CellActivityToJson(this);

  @override
  String toString() {
    return 'CellActivity(cellId: $cellId, speed: $speed, velocity: $velocity, growIntention: $growIntention, additionalAction: $additionalAction)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CellActivity &&
        other.cellId == cellId &&
        other.speed == speed &&
        other.velocity == velocity &&
        other.growIntention == growIntention &&
        other.additionalAction == additionalAction;
  }

  @override
  int get hashCode {
    return cellId.hashCode ^
        speed.hashCode ^
        velocity.hashCode ^
        growIntention.hashCode ^
        additionalAction.hashCode;
  }
}

Map<String, dynamic>? _moveActionToJson(MoveAction? moveAction) {
  if (moveAction == null) return null;

  if (moveAction is Merge) {
    return {
      'type': 'merge',
      'cellId': moveAction.cellId,
    };
  }

  return {'type': 'split'};
}

MoveAction? _moveActionFromJson(Map<String, dynamic>? json) {
  if (json == null) return null;

  return null;
}
