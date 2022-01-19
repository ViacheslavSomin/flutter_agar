import 'package:flutter_agar/src/entities/cell_property.dart';
import 'package:flutter_agar/src/entities/cells/cell.dart';
import 'package:json_annotation/json_annotation.dart';

part 'alien_cell.g.dart';

@JsonSerializable()
class AlienCell extends Cell {
  AlienCell({
    required String cellId,
    required CellProperty property,
  }) : super(
          cellId: cellId,
          property: property,
        );

  factory AlienCell.fromJson(Map<String, dynamic> json) =>
      _$AlienCellFromJson(json);

  Map<String, dynamic> toJson() => _$AlienCellToJson(this);

  @override
  String toString() => 'AlienCell(cellId: $cellId, property: $property)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AlienCell &&
        other.cellId == cellId &&
        other.property == property;
  }

  @override
  int get hashCode => cellId.hashCode ^ property.hashCode;
}
