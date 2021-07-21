// @dart=2.9
import 'package:flutter/material.dart';
//providers
import 'package:provider/provider.dart';
import 'providers/wallpapers.dart';
//screens
import 'screens/TypesScreen.dart';
import 'screens/WallpapersScreen.dart';
import 'screens/Initial.dart';
import 'screens/ImagePreviewScreen.dart';
import 'screens/FavoriteScreen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Wallpapers(),
        ),
      ],
      builder: (ctx, _) => MaterialApp(
        title: 'LEGACY WALLPAPERS',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          accentColor: Colors.white,
          textTheme: TextTheme(
            bodyText2: TextStyle(fontFamily: 'Infinity', color: Colors.white),
          ),
          appBarTheme: AppBarTheme(
            textTheme: TextTheme(
              headline6: TextStyle(
                  fontFamily: 'Simplifica',
                  fontSize: 35,
                  color: Color(0xCCffffff),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        home: Initial(),
        routes: {
          TypesScreen.name: (ctx) => TypesScreen(),
          WallpapersScreen.name: (ctx) => WallpapersScreen(),
          ImagePreviewScreen.name: (ctx) => ImagePreviewScreen(),
          FavoriteScreen.name: (ctx) => FavoriteScreen(),
        },
      ),
    );
  }
}
