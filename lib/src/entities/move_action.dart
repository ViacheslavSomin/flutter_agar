abstract class MoveAction {
  const MoveAction();
}

class Split extends MoveAction {
  const Split();
}

class Merge extends MoveAction {
  const Merge({
    required this.cellId,
  });

  final String cellId;
}
