import 'package:flutter/material.dart';
import 'package:legacywallpapers/providers/companies.dart';
import 'package:provider/provider.dart';
//widgets
import '../widgets/CompanyContainer.dart';
//screens
import 'WaitingScreen.dart';

class CompanyScreen extends StatelessWidget {
  static const String name = 'CompanyScreen';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<Companies>(context).fetchAndSet(),
        builder: (ctx, snapShot) {
          return snapShot.connectionState == ConnectionState.waiting
              ? WaitingScreen()
              : CompanyContainer();
        });
  }
}
