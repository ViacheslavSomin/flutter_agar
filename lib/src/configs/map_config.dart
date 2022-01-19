import 'package:json_annotation/json_annotation.dart';
part 'map_config.g.dart';

@JsonSerializable()
class MapConfig {
  MapConfig({
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  factory MapConfig.fromJson(Map<String, dynamic> json) =>
      _$MapConfigFromJson(json);

  Map<String, dynamic> toJson() => _$MapConfigToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MapConfig && other.height == height && other.width == width;
  }

  @override
  int get hashCode => height.hashCode ^ width.hashCode;

  @override
  String toString() => 'MapConfig(height: $height, width: $width)';
}
