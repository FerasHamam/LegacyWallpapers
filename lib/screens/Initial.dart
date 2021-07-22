import 'package:flutter/material.dart';
import 'package:legacywallpapers/providers/wallpapers.dart';
import 'package:provider/provider.dart';

//providers
import '../providers/wallpapers.dart';
//screens
import 'TypesScreen.dart';
import 'LoadingScreen.dart';

class Initial extends StatelessWidget {
  static String name = 'initial';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<Wallpapers>(context, listen: false).fetchData(),
      builder: (ctx, snapShot) {
        return snapShot.connectionState == ConnectionState.waiting
            ? LoadingScreen()
            : TypesScreen();
      },
    );
  }
}
