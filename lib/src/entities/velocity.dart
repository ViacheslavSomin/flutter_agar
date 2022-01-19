import 'package:json_annotation/json_annotation.dart';

part 'velocity.g.dart';

@JsonSerializable()
class Velocity {
  Velocity({
    this.x,
    this.y,
  });

  Velocity.zero()
      : x = 0,
        y = 0;

  final num? x;
  final num? y;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Velocity && other.x == x && other.y == y;
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  @override
  String toString() => 'Velocity(x: $x, y: $y)';

  factory Velocity.fromJson(Map<String, dynamic> json) =>
      _$VelocityFromJson(json);

  Map<String, dynamic> toJson() => _$VelocityToJson(this);
}
