// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'desired_cells_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DesiredCellsState _$DesiredCellsStateFromJson(Map json) => DesiredCellsState(
      myCells: (json['myCells'] as List<dynamic>)
          .map(
              (e) => CellActivity.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$DesiredCellsStateToJson(DesiredCellsState instance) =>
    <String, dynamic>{
      'myCells': instance.myCells.map((e) => e.toJson()).toList(),
    };
