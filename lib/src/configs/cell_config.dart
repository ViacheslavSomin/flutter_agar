import 'package:json_annotation/json_annotation.dart';

part 'cell_config.g.dart';

@JsonSerializable()
class CellConfig {
  CellConfig({
    required this.massToRadius,
    required this.toEatDiff,
    required this.collisionOffset,
    required this.minEatEfficiency,
    required this.maxEatEfficiency,
    required this.energyToEatEfficiency,
    required this.minMass,
    required this.maxMass,
    required this.energyToMass,
    required this.minSpeed,
    required this.maxSpeed,
    required this.energyToMaxSpeed,
    required this.minPower,
    required this.maxPower,
    required this.energyToPower,
    required this.maxVolatilization,
    required this.minVolatilization,
    required this.energyToVolatilization,
  });

  final double massToRadius;

  /// Mass difference needed to eat another cell
  final double toEatDiff;

  /// Cells must cross on this value to eat
  /// (cell1.radius * collisionOffset + cell2.radius * collisionOffset) < distance
  final double collisionOffset;

  final double minEatEfficiency;

  final double maxEatEfficiency;

  /// energy exchange rate for eat efficiency
  final double energyToEatEfficiency;

  final double minMass;

  final double maxMass;

  final double energyToMass;

  final double minSpeed;

  final double maxSpeed;

  final double energyToMaxSpeed;

  final double minPower;

  final double maxPower;

  final double energyToPower;

  final double maxVolatilization;

  final double minVolatilization;

  final double energyToVolatilization;

  factory CellConfig.fromJson(Map<String, dynamic> json) =>
      _$CellConfigFromJson(json);

  Map<String, dynamic> toJson() => _$CellConfigToJson(this);

  @override
  String toString() {
    return 'CellConfig(massToRadius: $massToRadius, toEatDiff: $toEatDiff, collisionOffset: $collisionOffset, minEatEfficiency: $minEatEfficiency, maxEatEfficiency: $maxEatEfficiency, energyToEatEfficiency: $energyToEatEfficiency, minMass: $minMass, maxMass: $maxMass, energyToMass: $energyToMass, minSpeed: $minSpeed, maxSpeed: $maxSpeed, energyToMaxSpeed: $energyToMaxSpeed, minPower: $minPower, maxPower: $maxPower, energyToPower: $energyToPower, maxVolatilization: $maxVolatilization, minVolatilization: $minVolatilization, energyToVolatilization: $energyToVolatilization)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CellConfig &&
        other.massToRadius == massToRadius &&
        other.toEatDiff == toEatDiff &&
        other.collisionOffset == collisionOffset &&
        other.minEatEfficiency == minEatEfficiency &&
        other.maxEatEfficiency == maxEatEfficiency &&
        other.energyToEatEfficiency == energyToEatEfficiency &&
        other.minMass == minMass &&
        other.maxMass == maxMass &&
        other.energyToMass == energyToMass &&
        other.minSpeed == minSpeed &&
        other.maxSpeed == maxSpeed &&
        other.energyToMaxSpeed == energyToMaxSpeed &&
        other.minPower == minPower &&
        other.maxPower == maxPower &&
        other.energyToPower == energyToPower &&
        other.maxVolatilization == maxVolatilization &&
        other.minVolatilization == minVolatilization &&
        other.energyToVolatilization == energyToVolatilization;
  }

  @override
  int get hashCode {
    return massToRadius.hashCode ^
        toEatDiff.hashCode ^
        collisionOffset.hashCode ^
        minEatEfficiency.hashCode ^
        maxEatEfficiency.hashCode ^
        energyToEatEfficiency.hashCode ^
        minMass.hashCode ^
        maxMass.hashCode ^
        energyToMass.hashCode ^
        minSpeed.hashCode ^
        maxSpeed.hashCode ^
        energyToMaxSpeed.hashCode ^
        minPower.hashCode ^
        maxPower.hashCode ^
        energyToPower.hashCode ^
        maxVolatilization.hashCode ^
        minVolatilization.hashCode ^
        energyToVolatilization.hashCode;
  }
}
