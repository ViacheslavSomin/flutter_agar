# flutter_agar

## Set up

1. Create a new flutter project
2. Add the following dependency to `pubspec.yaml` file

   ```yaml
   dependencies:
     flutter:
       sdk: flutter

     flutter_agar:
       git:
         url: https://github.com/ViacheslavSomin/flutter_agar.git
   ```

3. Create your own implementation of `CellLogic` class

   ```dart
   import 'package:flutter_agar/flutter_agar.dart';

   class CellLogicImpl implements CellLogic {
     @override
     DesiredCellsState? handleGameUpdate(MapState mapState) {
       // Your logic
       return DesiredCellsState(myCells: myCells);
     }
   }
   ```

4. In `main.dart` pass `AgarClientView` to `MaterialApp`'s `home` property and pass `CellLogicImpl` to `AgarClientView`s `cellLogic` property

   ```dart
   void main() {
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
   ```
