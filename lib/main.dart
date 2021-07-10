import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:legacywallpapers/screens/Initial.dart';

//providers
import 'package:provider/provider.dart';
import 'providers/wallpapers.dart';
import 'providers/companies.dart';
//screens
import 'screens/Initial.dart';

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
        ChangeNotifierProvider.value(value: Companies()),
      ],
      builder: (ctx, _) => MaterialApp(
        title: 'LEGACY WALLPAPERS',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.indigo,
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
        routes: {},
      ),
    );
  }
}
