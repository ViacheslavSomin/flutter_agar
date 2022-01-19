// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Food _$FoodFromJson(Map json) => Food(
      id: json['id'] as String,
      mass: json['mass'] as num,
      position:
          Position.fromJson(Map<String, dynamic>.from(json['position'] as Map)),
    );

Map<String, dynamic> _$FoodToJson(Food instance) => <String, dynamic>{
      'id': instance.id,
      'mass': instance.mass,
      'position': instance.position.toJson(),
    };
