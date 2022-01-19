import 'package:flutter/foundation.dart';
import 'package:flutter_agar/src/entities/cell_activity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'desired_cells_state.g.dart';

@JsonSerializable()
class DesiredCellsState {
  final List<CellActivity> myCells;
  DesiredCellsState({
    required this.myCells,
  });

  factory DesiredCellsState.fromJson(Map<String, dynamic> json) =>
      _$DesiredCellsStateFromJson(json);

  Map<String, dynamic> toJson() => _$DesiredCellsStateToJson(this);

  @override
  String toString() => 'DesiredCellsState(myCells: $myCells)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DesiredCellsState && listEquals(other.myCells, myCells);
  }

  @override
  int get hashCode => myCells.hashCode;
}
