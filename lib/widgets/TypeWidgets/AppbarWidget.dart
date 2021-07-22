import 'package:flutter/material.dart';
//screens
import 'package:legacywallpapers/screens/AboutScreen.dart';
import 'package:legacywallpapers/screens/FavoriteScreen.dart';

class AppbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      width: deviceSize.width,
      margin: EdgeInsets.only(top: deviceSize.width * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.center,
            icon: Icon(Icons.details_sharp,
                color: Color(0xccffffff), size: deviceSize.width * 0.12),
            onPressed: () {
              Navigator.of(context).pushNamed(AboutScreen.name);
            },
          ),
          SizedBox(
            width: deviceSize.width * 0.23,
          ),
          SizedBox(
            width: deviceSize.width * 0.3,
            child: Text(
              'L E G A C Y',
              style:
                  Theme.of(context).appBarTheme.textTheme!.headline6!.copyWith(
                        fontSize: deviceSize.width * 0.105,
                      ),
            ),
          ),
          SizedBox(
            width: deviceSize.width * 0.22,
          ),
          IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.center,
            icon: Icon(Icons.favorite_border_sharp,
                color: Color(0xccffffff), size: deviceSize.width * 0.12),
            onPressed: () {
              Navigator.of(context).pushNamed(FavoriteScreen.name);
            },
          ),
        ],
      ),
    );
  }
}
