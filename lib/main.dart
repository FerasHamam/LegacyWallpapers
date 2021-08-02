// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legacywallpapers/screens/AboutScreen.dart';
//providers
import 'package:provider/provider.dart';
import 'providers/wallpapers.dart';
//screens
import 'screens/AboutScreen.dart';
import 'screens/FavoriteScreen.dart';
import 'screens/ImagePreviewScreen.dart';
import 'screens/Initial.dart';
import 'screens/TypesScreen.dart';
import 'screens/WallpapersScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(systemNavigationBarColor: Colors.black),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1080, 2400),
      builder: () => MultiProvider(
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
                    fontSize: 30.sp,
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
            AboutScreen.name: (ctx) => AboutScreen(),
            Initial.name: (ctx) => Initial(),
          },
        ),
      ),
    );
  }
}
