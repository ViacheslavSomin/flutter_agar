import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_agar/constants.dart';
import 'package:flutter_agar/src/entities/desired_cells_state.dart';
import 'map_state.dart';

abstract class CellLogic {
  late final MethodChannel _methodChannel;

  void setup(MethodChannel methodChannel) {
    _methodChannel = methodChannel;

    _methodChannel.setMethodCallHandler((call) async {
      try {
        if (call.method == Constants.handleGameUpdate) {
          return await _handleGameUpdate(call);
        }
      } catch (e, s) {
        log('$e\n\n$s');
      }
    });
  }

  DesiredCellsState? handleGameUpdate(MapState mapState);

  Future<Map<String, dynamic>?> _handleGameUpdate(MethodCall call) async {
    final mapState = MapState.fromJson(
      Map<String, dynamic>.from(call.arguments),
    );

    return handleGameUpdate(mapState)?.toJson();
  }
}
