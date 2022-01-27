import 'package:flutter_agar/flutter_agar.dart';

class CellLogicImpl implements CellLogic {
  @override
  DesiredCellsState? handleGameUpdate(MapState mapState) {
    final myCells = mapState.myCells;

    List<CellActivity> cellActivities = [];

    for (final myCell in myCells) {
      final cellPosition = myCell.property.position;

      final targetPosition = findClosestFood(mapState, myCell)?.position;

      cellActivities.add(
        CellActivity(
          cellId: myCell.cellId,
          speed: 1.0,
          velocity: cellPosition.moveTo(targetPosition),
          growIntention: GrowIntention(
            mass: myCell.availableEnergy * 0.3,
            maxSpeed: myCell.availableEnergy * 0.7,
          ),
        ),
      );
    }

    return DesiredCellsState(myCells: cellActivities);
  }

  Food? findClosestFood(MapState mapState, MyCell cell) {
    if (mapState.food.isEmpty) return null;

    Food closestFood = mapState.food.first;

    for (final food in mapState.food) {
      final closestFoodDistance =
          closestFood.position.distanceTo(cell.property.position);

      final currentFoodDistance =
          food.position.distanceTo(cell.property.position);

      if (currentFoodDistance < closestFoodDistance) {
        closestFood = food;
      }
    }

    return closestFood;
  }
}
