import 'package:flutter_agar/src/configs/configs.dart';
import 'package:flutter_agar/src/entities/desired_cells_state.dart';
import 'map_state.dart';

abstract class CellLogic {
  late GameConfig _gameConfig;

  GameConfig get gameConfig => _gameConfig;

  void configure(GameConfig gameConfig) {
    _gameConfig = gameConfig;
  }

  DesiredCellsState? handleGameUpdate(MapState mapState);
}
