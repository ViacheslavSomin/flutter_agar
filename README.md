# flutter_agar

## Set up

1. Create a new flutter project
2. For android set `minSdkVersion` to `24` and `ext.kotlin_version` to `1.6.10`
3. Add the following dependency to `pubspec.yaml` file

   ```yaml
   dependencies:
     flutter:
       sdk: flutter

     flutter_agar:
       git:
         url: https://github.com/ViacheslavSomin/flutter_agar.git
         ref: 0f9d5a2
   ```

4. Create your own implementation of `CellLogic` class

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

5. In `main.dart` pass `AgarClientView` to `MaterialApp`'s `home` property and pass `CellLogicImpl` to `AgarClientView`'s `cellLogic` property

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

6. (Temporary) Add `github.properties` file to android folder with following content:

   ```properties
   gitHubUser=Your github username
   gitHubKey=Your github personal access token
   ```

7. (Temporary) Add following code to android project's `build.gradle` file:

   ```gradle
   Properties props = new Properties()
   def propFile = file('github.properties')
   props.load(new FileInputStream(propFile))

   buildscript {
      // some code
   }

   allprojects {
       repositories {
           google()
           mavenCentral()
           maven {
               name = "GitHubPackages"
               url = uri("https://maven.pkg.github.com/pavlozoria/agarepam")
               credentials {
                   username = props['gitHubUser']
                   password = props['gitHubKey']
               }
           }
       }
   }

   // some code
   ```
