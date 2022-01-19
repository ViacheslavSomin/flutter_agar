import 'package:flutter_agar/src/entities/position.dart';
import 'package:flutter_agar/src/entities/velocity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cell_property.g.dart';

@JsonSerializable()
class CellProperty {
  CellProperty({
    required this.mass,
    required this.radius,
    required this.speed,
    required this.position,
    required this.velocity,
    required this.eatEfficiency,
  });

  final double mass;
  final double radius;
  final double speed;
  final Position position;
  final Velocity velocity;
  final double eatEfficiency;

  factory CellProperty.fromJson(Map<String, dynamic> json) =>
      _$CellPropertyFromJson(json);

  Map<String, dynamic> toJson() => _$CellPropertyToJson(this);

  @override
  String toString() {
    return 'CellProperty(mass: $mass, radius: $radius, speed: $speed, position: $position, velocity: $velocity, eatEfficiency: $eatEfficiency)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CellProperty &&
        other.mass == mass &&
        other.radius == radius &&
        other.speed == speed &&
        other.position == position &&
        other.velocity == velocity &&
        other.eatEfficiency == eatEfficiency;
  }

  @override
  int get hashCode {
    return mass.hashCode ^
        radius.hashCode ^
        speed.hashCode ^
        position.hashCode ^
        velocity.hashCode ^
        eatEfficiency.hashCode;
  }
}
