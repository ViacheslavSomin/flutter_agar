import 'dart:async';
import 'dart:developer';

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
        Cell,
        MyCell,
        AlienCell,
        CellActivity,
        GrowIntention,
        MoveAction,
        Split,
        Merge,
        Position,
        Velocity,
        ClientRoomView,
        AgarClientView;

class FlutterAgar {
  static final _instance = FlutterAgar._();

  static const MethodChannel _channel = MethodChannel(
    Constants.methodChannelName,
  );

  FlutterAgar._() {
    _setup();
  }

  factory FlutterAgar() {
    return _instance;
  }

  late CellLogic _cellLogic;

  void _setup() {
    _channel.setMethodCallHandler((call) async {
      try {
        if (call.method == Constants.handleGameUpdate) {
          return _handleGameUpdate(call);
        }
        if (call.method == Constants.configureCell) {
          _configureCell(call);
          return null;
        }
      } catch (e, s) {
        log('$e\n\n$s');
      }
    });
  }

  Map<String, dynamic>? _handleGameUpdate(MethodCall call) {
    final mapState = MapState.fromJson(
      Map<String, dynamic>.from(call.arguments),
    );

    return _cellLogic.handleGameUpdate(mapState)?.toJson();
  }

  void _configureCell(MethodCall call) {
    final gameConfig = GameConfig.fromJson(
      Map<String, dynamic>.from(call.arguments),
    );

    _cellLogic.configure(gameConfig);
  }

  Future<void> initializeGameEngine(CellLogic cellLogic) async {
    WidgetsFlutterBinding.ensureInitialized();

    _cellLogic = cellLogic;

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
