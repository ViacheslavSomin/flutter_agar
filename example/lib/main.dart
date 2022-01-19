import 'package:flutter/material.dart';

import 'package:flutter_agar/flutter_agar.dart';
import 'package:flutter_agar_example/cell_logic_impl.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  await FlutterAgar().initializeGameEngine(CellLogicImpl());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TextEditingController _roomIdController;

  @override
  void initState() {
    super.initState();
    _roomIdController = TextEditingController();
  }

  @override
  void dispose() {
    _roomIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Agar'),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _roomIdController,
                  decoration: const InputDecoration(labelText: 'RoomId'),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () async {
                    await FlutterAgar().startGame(_roomIdController.text);
                    launch(
                      'http://45.77.67.171/client/?room=${_roomIdController.text}',
                    );
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
        );
      }),
    );
  }
}
