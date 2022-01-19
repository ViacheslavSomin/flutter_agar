import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_agar/constants.dart';
import 'package:flutter_agar/src/entities/cell_logic.dart';
import 'package:flutter_agar/src/src.dart';

export 'src/src.dart'
    show
        CellLogic,
        MapState,
        DesiredCellsState,
        Food,
        MyCell,
        CellActivity,
        GrowIntention,
        ClientRoomView,
        Position;

class FlutterAgar {
  FlutterAgar._();

  static const MethodChannel _channel = MethodChannel(
    Constants.methodChannelName,
  );

  static final _instance = FlutterAgar._();

  factory FlutterAgar() {
    return _instance;
  }

  late CellLogic _cellLogic;

  Future<void> initializeGameEngine(CellLogic cellLogic) async {
    WidgetsFlutterBinding.ensureInitialized();

    _cellLogic = cellLogic;
    _cellLogic.setup(_channel);

    return _channel.invokeMethod(Constants.initializeGameEngine);
  }

  Future<void> startGame(String roomId) async {
    return _channel.invokeMethod(
      Constants.startGame,
      {
        Constants.roomId: roomId,
      },
    );
  }

  Future<void> stopGame() async {
    return _channel.invokeMethod(Constants.stopGame);
  }
}
