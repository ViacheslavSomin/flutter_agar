import 'package:json_annotation/json_annotation.dart';

part 'food_config.g.dart';

@JsonSerializable()
class FoodConfig {
  FoodConfig({
    required this.mass,
  });

  final double mass;

  factory FoodConfig.fromJson(Map<String, dynamic> json) =>
      _$FoodConfigFromJson(json);

  Map<String, dynamic> toJson() => _$FoodConfigToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FoodConfig && other.mass == mass;
  }

  @override
  int get hashCode => mass.hashCode;

  @override
  String toString() => 'FoodConfig(mass: $mass)';
}
