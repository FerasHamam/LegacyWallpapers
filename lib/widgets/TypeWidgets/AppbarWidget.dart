import 'package:flutter/material.dart';
//screens
import 'package:legacywallpapers/screens/AboutScreen.dart';
import 'package:legacywallpapers/screens/FavoriteScreen.dart';

class AppbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    EdgeInsets viewInsets = MediaQuery.of(context).viewInsets;
    return Container(
      width: deviceSize.width,
      margin: EdgeInsets.only(
          top: deviceSize.width * 0.02,
          right: deviceSize.width * 0.02,
          left: deviceSize.width * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            padding: EdgeInsets.only(bottom: deviceSize.width * 0.02),
            alignment: Alignment.center,
            icon: Icon(Icons.details_sharp,
                color: Color(0xccffffff), size: deviceSize.width * 0.11),
            onPressed: () {
              Navigator.of(context).pushNamed(AboutScreen.name);
            },
          ),
          SizedBox(
            width: deviceSize.width * 0.1,
          ),
          SizedBox(
            width: deviceSize.width * 0.51,
            child: Text(
              'L E G A C Y',
              textAlign: TextAlign.center,
              style:
                  Theme.of(context).appBarTheme.textTheme!.headline6!.copyWith(
                        fontSize: (deviceSize.width -
                                viewInsets.right -
                                viewInsets.left) *
                            0.12,
                      ),
            ),
          ),
          SizedBox(
            width: deviceSize.width * 0.1,
          ),
          IconButton(
            padding: EdgeInsets.only(bottom: deviceSize.width * 0.02),
            alignment: Alignment.center,
            icon: Icon(Icons.favorite_border_sharp,
                color: Color(0xccffffff), size: deviceSize.width * 0.11),
            onPressed: () {
              Navigator.of(context).pushNamed(FavoriteScreen.name);
            },
          ),
        ],
      ),
    );
  }
}
