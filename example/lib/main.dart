import 'package:flutter/material.dart';

import 'package:flutter_agar/flutter_agar.dart';
import 'package:flutter_agar_example/cell_logic_impl.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AgarClientView(
        cellLogic: CellLogicImpl(),
      ),
    );
  }
}
