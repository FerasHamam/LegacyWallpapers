import 'package:flutter/material.dart';
import 'package:legacywallpapers/providers/wallpapers.dart';
import 'package:provider/provider.dart';
//screens
import '../screens/WallpapersScreen.dart';
//widget
import 'CountingWidget.dart';

class TypeCard extends StatelessWidget {
  final String name;
  TypeCard(this.name);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(WallpapersScreen.name);
      },
      child: Container(
        padding: EdgeInsets.only(top: deviceSize.height * 0.4),
        child: Center(
          child: CountingWidget(Provider.of<Wallpapers>(context, listen: false)
              .typeName(name)
              .length),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/images/$name.jpg'),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(15),
          color: Colors.blue,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              spreadRadius: 4,
              color: Colors.black12,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        margin: EdgeInsets.only(
          top: deviceSize.height * 0.04,
          right: deviceSize.width * 0.12,
          left: deviceSize.width * 0.12,
          bottom: deviceSize.height * 0.02,
        ),
      ),
    );
  }
}
