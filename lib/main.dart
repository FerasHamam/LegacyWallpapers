import 'package:flutter/material.dart';
//firebase
import 'package:firebase_core/firebase_core.dart';
//providers
import 'package:provider/provider.dart';
import 'providers/wallpapers.dart';
import 'providers/types.dart';
//screens
import 'screens/TypesScreen.dart';
import 'screens/WallpapersScreen.dart';
import 'screens/Initial.dart';
import 'screens/ImagePreviewScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Types(),
        ),
        ChangeNotifierProvider.value(
          value: Wallpapers(),
        ),
      ],
      builder: (ctx, _) => MaterialApp(
        title: 'LEGACY WALLPAPERS',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.white,
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
        home: Initial(),
        routes: {
          TypesScreen.name: (ctx) => TypesScreen(),
          WallpapersScreen.name: (ctx) => WallpapersScreen(),
          ImagePreviewScreen.name: (ctx) => ImagePreviewScreen(),
        },
      ),
    );
  }
}
