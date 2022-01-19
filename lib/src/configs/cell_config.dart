import 'package:json_annotation/json_annotation.dart';

part 'cell_config.g.dart';

@JsonSerializable()
class CellConfig {
  CellConfig({
    required this.minMass,
    required this.maxMass,
    required this.minSpeed,
    required this.maxSpeed,
    required this.volatilization,
  });

  final double minMass;
  final double maxMass;

  final double minSpeed;
  final double maxSpeed;

  final double volatilization;

  factory CellConfig.fromJson(Map<String, dynamic> json) =>
      _$CellConfigFromJson(json);

  Map<String, dynamic> toJson() => _$CellConfigToJson(this);

  @override
  String toString() {
    return 'CellConfig(minMass: $minMass, maxMass: $maxMass, minSpeed: $minSpeed, maxSpeed: $maxSpeed, volatilization: $volatilization)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CellConfig &&
        other.minMass == minMass &&
        other.maxMass == maxMass &&
        other.minSpeed == minSpeed &&
        other.maxSpeed == maxSpeed &&
        other.volatilization == volatilization;
  }

  @override
  int get hashCode {
    return minMass.hashCode ^
        maxMass.hashCode ^
        minSpeed.hashCode ^
        maxSpeed.hashCode ^
        volatilization.hashCode;
  }
}
