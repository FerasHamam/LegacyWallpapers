import 'package:flutter/material.dart';
import 'package:legacywallpapers/providers/companies.dart';
import 'package:provider/provider.dart';
//providers
//screens
import 'CompanyScreen.dart';
import 'LoadingScreen.dart';

class Initial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<Companies>(context, listen: false).fetchAndSet(),
        builder: (ctx, AsyncSnapshot snapShot) =>
            snapShot.connectionState == ConnectionState.waiting
                ? LoadingScreen()
                : CompanyScreen());
  }
}
