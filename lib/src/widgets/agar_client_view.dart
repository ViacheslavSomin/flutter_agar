import 'package:flutter/material.dart';

import 'package:flutter_agar/flutter_agar.dart';

class AgarClientView extends StatefulWidget {
  const AgarClientView({
    Key? key,
    required this.cellLogic,
  }) : super(key: key);

  final CellLogic cellLogic;

  @override
  _AgarClientViewState createState() => _AgarClientViewState();
}

class _AgarClientViewState extends State<AgarClientView> {
  late TextEditingController _roomIdController;

  Future<void> _onInitState() async {
    await FlutterAgar().initializeGameEngine(widget.cellLogic);
    await FlutterAgar().stopGame();
  }

  Future<void> _onReassemble() async {
    await FlutterAgar().stopGame();
    final roomId = _roomIdController.text;
    if (roomId.isEmpty) return;
    await FlutterAgar().startGame(roomId);
  }

  @override
  void initState() {
    super.initState();
    _onInitState();
    _roomIdController = TextEditingController();
  }

  @override
  void reassemble() {
    super.reassemble();
    _onReassemble();
  }

  @override
  void dispose() {
    _roomIdController.dispose();
    FlutterAgar().stopGame();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Agar'),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _roomIdController,
                  decoration: const InputDecoration(
                    labelText: 'RoomId',
                    filled: true,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    await _startGame();

                    /* Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ClientRoomView(
                              roomId: _roomIdController.text,
                            ),
                          ),
                        ); */
                  },
                  child: const Text('Start'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    FlutterAgar().stopGame();
                  },
                  child: const Text('Stop'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _startGame() async {
    final roomId = _roomIdController.text;
    if (roomId.isEmpty) return;
    await FlutterAgar().startGame(roomId);
  }
}
