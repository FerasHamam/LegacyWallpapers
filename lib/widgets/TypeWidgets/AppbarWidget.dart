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
      height: deviceSize.height * 0.06,
      margin: EdgeInsets.only(
        top: deviceSize.width * 0.025,
        right: deviceSize.width * 0.02,
        left: deviceSize.width * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            padding: EdgeInsets.only(bottom: deviceSize.height * 0.05),
            alignment: Alignment.center,
            icon: Icon(Icons.details_sharp,
                color: Color(0xccffffff), size: deviceSize.height * 0.054),
            onPressed: () {
              Navigator.of(context).pushNamed(AboutScreen.name);
            },
          ),
          SizedBox(
            width: deviceSize.width * 0.1,
          ),
          Container(
            width: deviceSize.width * 0.51,
            height: deviceSize.height * 0.06,
            alignment: Alignment.center,
            child: Text(
              'L E G A C Y',
              style:
                  Theme.of(context).appBarTheme.textTheme!.headline6!.copyWith(
                        fontSize: deviceSize.height * 0.055,
                      ),
            ),
          ),
          SizedBox(
            width: deviceSize.width * 0.1,
          ),
          IconButton(
            padding: EdgeInsets.only(bottom: deviceSize.height * 0.05),
            alignment: Alignment.center,
            icon: Icon(Icons.favorite_border_sharp,
                color: Color(0xccffffff), size: deviceSize.height * 0.054),
            onPressed: () {
              Navigator.of(context).pushNamed(FavoriteScreen.name);
            },
          ),
        ],
      ),
    );
  }
}
