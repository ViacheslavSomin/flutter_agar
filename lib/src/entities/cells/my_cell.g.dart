// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_cell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyCell _$MyCellFromJson(Map json) => MyCell(
      cellId: json['cellId'] as String,
      property: CellProperty.fromJson(
          Map<String, dynamic>.from(json['property'] as Map)),
      availableEnergy: (json['availableEnergy'] as num).toDouble(),
      canSplit: json['canSplit'] as bool,
      canMerge: json['canMerge'] as bool,
    );

Map<String, dynamic> _$MyCellToJson(MyCell instance) => <String, dynamic>{
      'cellId': instance.cellId,
      'property': instance.property.toJson(),
      'availableEnergy': instance.availableEnergy,
      'canSplit': instance.canSplit,
      'canMerge': instance.canMerge,
    };
