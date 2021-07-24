import 'package:flutter/material.dart';
import 'package:legacywallpapers/providers/wallpapers.dart';
import 'package:legacywallpapers/screens/Initial.dart';
import 'package:provider/provider.dart';
//screens
import '../../screens/WallpapersScreen.dart';
//widget
import 'CountingWidget.dart';

class TypeCard extends StatelessWidget {
  final String name;
  final reload;
  TypeCard(this.name, this.reload);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    final provider =
        Provider.of<Wallpapers>(context, listen: false).walls[name];

    return GestureDetector(
      onTap: () {
        if (!reload) Navigator.of(context).pushNamed(WallpapersScreen.name);
      },
      child: Container(
        padding: EdgeInsets.only(top: deviceSize.height * 0.4),
        child: Center(
          child: reload == false
              ? CountingWidget(provider == null ? 0 : provider.length)
              : IconButton(
                  padding: EdgeInsets.only(
                      right: deviceSize.width * 0.15,
                      bottom: deviceSize.height * 0.3),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(Initial.name);
                  },
                  icon: Icon(
                    Icons.replay_sharp,
                    size: deviceSize.width * 0.2,
                    color: Colors.white,
                  )),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/images/$name.jpg'),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(15),
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
          bottom: deviceSize.height * 0.03,
        ),
      ),
    );
  }
}