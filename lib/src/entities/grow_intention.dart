import 'package:json_annotation/json_annotation.dart';

part 'grow_intention.g.dart';

@JsonSerializable()
class GrowIntention {
  GrowIntention({
    this.eatEfficiency,
    this.maxSpeed,
    this.power,
    this.mass,
  });

  final num? eatEfficiency;
  final num? maxSpeed;
  final num? power;
  final num? mass;

  factory GrowIntention.fromJson(Map<String, dynamic> json) =>
      _$GrowIntentionFromJson(json);

  Map<String, dynamic> toJson() => _$GrowIntentionToJson(this);

  @override
  String toString() {
    return 'GrowIntention(eatEfficiency: $eatEfficiency, maxSpeed: $maxSpeed, power: $power, mass: $mass)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GrowIntention &&
        other.eatEfficiency == eatEfficiency &&
        other.maxSpeed == maxSpeed &&
        other.power == power &&
        other.mass == mass;
  }

  @override
  int get hashCode {
    return eatEfficiency.hashCode ^
        maxSpeed.hashCode ^
        power.hashCode ^
        mass.hashCode;
  }
}
