import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

//providers
import 'package:provider/provider.dart';
import 'providers/wallpapers.dart';
import 'providers/companies.dart';
//screens
import 'screens/InitialScreen.dart';
import 'screens/WallpaperScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Wallpapers()),
        ChangeNotifierProvider.value(value: Companies())
      ],
      builder: (ctx, _) => MaterialApp(
        title: 'LEGACY WALLPAPERS',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          accentColor: Colors.blueGrey,
          textTheme: TextTheme(
            bodyText2: TextStyle(fontFamily: 'RobotoSlab', color: Colors.white),
          ),
          appBarTheme: AppBarTheme(
            textTheme: TextTheme(
              headline6: TextStyle(fontFamily: 'RobotoSlab', fontSize: 20),
            ),
          ),
        ),
        home: InitialScreen(),
        routes: {
          InitialScreen.name: (ctx) => InitialScreen(),
          WallpaperScreen.name: (ctx) => WallpaperScreen(),
        },
      ),
    );
  }
}
