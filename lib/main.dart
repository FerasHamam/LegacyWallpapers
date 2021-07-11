import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//providers
import 'package:provider/provider.dart';
import 'providers/types.dart';
//screens
import 'screens/TypesScreen.dart';
import 'screens/WallpapersScreen.dart';

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
        ChangeNotifierProvider.value(value: Types()),
      ],
      builder: (ctx, _) => MaterialApp(
        title: 'LEGACY WALLPAPERS',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          accentColor: Colors.black,
          textTheme: TextTheme(
            bodyText2: TextStyle(fontFamily: 'RobotoSlab', color: Colors.white),
          ),
          appBarTheme: AppBarTheme(
            textTheme: TextTheme(
              headline6: TextStyle(
                  fontFamily: 'RobotoSlab',
                  fontSize: 24,
                  color: Color(0xeeffffff)),
            ),
          ),
        ),
        home: TypesScreen(),
        routes: {
          TypesScreen.name: (ctx) => TypesScreen(),
          WallpapersScreen.name: (ctx) => WallpapersScreen(),
        },
      ),
    );
  }
}
