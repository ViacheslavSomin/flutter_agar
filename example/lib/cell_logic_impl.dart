import 'package:flutter_agar/flutter_agar.dart';

class CellLogicImpl extends CellLogic {
  @override
  DesiredCellsState? handleGameUpdate(MapState mapState) {
    final myCells = mapState.myCells;

    List<CellActivity> cellActivities = [];

    for (final myCell in myCells) {
      final cellPosition = myCell.property.position;

      final targetPosition = findClosestFood(mapState, myCell)?.position;

      final speed = targetPosition != null
          ? targetPosition.distanceTo(cellPosition) <
                  (myCell.property.radius * 5)
              ? targetPosition.distanceTo(cellPosition) /
                  (myCell.property.radius * 2.5)
              : 1.0
          : 1.0;

      cellActivities.add(
        CellActivity(
          cellId: myCell.cellId,
          speed: speed,
          velocity: cellPosition.moveTo(targetPosition),
          growIntention: GrowIntention(
            maxSpeed: myCell.availableEnergy,
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
