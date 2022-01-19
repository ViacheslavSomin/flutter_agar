import 'package:flutter_agar/src/entities/cell_property.dart';
import 'package:flutter_agar/src/entities/cells/cell.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_cell.g.dart';

@JsonSerializable()
class MyCell extends Cell {
  MyCell({
    required String cellId,
    required CellProperty property,
    required this.availableEnergy,
    required this.canSplit,
    required this.canMerge,
  }) : super(cellId: cellId, property: property);

  final double availableEnergy;
  final bool canSplit;
  final bool canMerge;

  factory MyCell.fromJson(Map<String, dynamic> json) => _$MyCellFromJson(json);

  Map<String, dynamic> toJson() => _$MyCellToJson(this);

  @override
  String toString() =>
      'MyCell(cellId: $cellId, property: $property, availableEnergy: $availableEnergy, canSplit: $canSplit, canMerge: $canMerge)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MyCell &&
        other.cellId == cellId &&
        other.property == property &&
        other.availableEnergy == availableEnergy &&
        other.canSplit == canSplit &&
        other.canMerge == canMerge;
  }

  @override
  int get hashCode =>
      cellId.hashCode ^
      property.hashCode ^
      availableEnergy.hashCode ^
      canSplit.hashCode ^
      canMerge.hashCode;
}
