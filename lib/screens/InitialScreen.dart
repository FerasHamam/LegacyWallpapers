import 'package:flutter/material.dart';
import 'package:legacywallpapers/providers/companies.dart';
import 'package:provider/provider.dart';
//widgets
import 'CompanyScreen.dart';
//screens
import 'WaitingScreen.dart';

class InitialScreen extends StatelessWidget {
  static const String name = 'InitialScreen';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<Companies>(context).fetchAndSet(),
        builder: (ctx, snapShot) {
          return snapShot.connectionState == ConnectionState.waiting
              ? WaitingScreen()
              : CompanyScreen();
        });
  }
}
