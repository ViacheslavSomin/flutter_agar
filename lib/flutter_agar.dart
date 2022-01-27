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
        MyCell,
        CellActivity,
        GrowIntention,
        ClientRoomView,
        AgarClientView,
        MoveAction,
        Split,
        Merge,
        Position;

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
          return await _handleGameUpdate(call);
        }
      } catch (e, s) {
        log('$e\n\n$s');
      }
    });
  }

  Future<Map<String, dynamic>?> _handleGameUpdate(MethodCall call) async {
    final mapState = MapState.fromJson(
      Map<String, dynamic>.from(call.arguments),
    );

    return _cellLogic.handleGameUpdate(mapState)?.toJson();
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
