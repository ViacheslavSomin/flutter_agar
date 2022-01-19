import 'package:flutter_agar/src/entities/position.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food.g.dart';

@JsonSerializable()
class Food {
  Food({
    required this.id,
    required this.mass,
    required this.position,
  });

  final String id;
  final num mass;
  final Position position;

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);

  Map<String, dynamic> toJson() => _$FoodToJson(this);

  @override
  String toString() => 'Food(id: $id, mass: $mass, position: $position)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Food &&
        other.id == id &&
        other.mass == mass &&
        other.position == position;
  }

  @override
  int get hashCode => id.hashCode ^ mass.hashCode ^ position.hashCode;
}
