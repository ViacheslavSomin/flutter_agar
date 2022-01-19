// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cell_activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CellActivity _$CellActivityFromJson(Map json) => CellActivity(
      cellId: json['cellId'] as String,
      speed: (json['speed'] as num).toDouble(),
      velocity: json['velocity'] == null
          ? null
          : Velocity.fromJson(
              Map<String, dynamic>.from(json['velocity'] as Map)),
      growIntention: json['growIntention'] == null
          ? null
          : GrowIntention.fromJson(
              Map<String, dynamic>.from(json['growIntention'] as Map)),
      additionalAction: _moveActionFromJson(
          json['additionalAction'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$CellActivityToJson(CellActivity instance) =>
    <String, dynamic>{
      'cellId': instance.cellId,
      'speed': instance.speed,
      'velocity': instance.velocity?.toJson(),
      'growIntention': instance.growIntention?.toJson(),
      'additionalAction': _moveActionToJson(instance.additionalAction),
    };
