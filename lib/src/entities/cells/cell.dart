import 'package:flutter_agar/src/entities/cell_property.dart';

abstract class Cell {
  Cell({
    required this.cellId,
    required this.property,
  });

  final String cellId;
  final CellProperty property;
}
