import 'package:flutter_agar/src/entities/desired_cells_state.dart';
import 'map_state.dart';

abstract class CellLogic {
  DesiredCellsState? handleGameUpdate(MapState mapState);
}
