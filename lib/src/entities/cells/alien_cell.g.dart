// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alien_cell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlienCell _$AlienCellFromJson(Map json) => AlienCell(
      cellId: json['cellId'] as String,
      property: CellProperty.fromJson(
          Map<String, dynamic>.from(json['property'] as Map)),
    );

Map<String, dynamic> _$AlienCellToJson(AlienCell instance) => <String, dynamic>{
      'cellId': instance.cellId,
      'property': instance.property.toJson(),
    };
