import 'package:flutter/material.dart';

//screens
import 'package:legacywallpapers/screens/FavoriteScreen.dart';

class AppbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: deviceSize.width * 0.02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: deviceSize.width * 0.32,
          ),
          Text(
            'L E G A C Y',
            style: Theme.of(context)
                .appBarTheme
                .textTheme!
                .headline6!
                .copyWith(fontSize: deviceSize.width * 0.1),
          ),
          SizedBox(
            width: deviceSize.width * 0.22,
          ),
          IconButton(
            icon: Icon(Icons.favorite_rounded,
                color: Color(0xccffffff), size: deviceSize.width * 0.1),
            onPressed: () {
              Navigator.of(context).pushNamed(FavoriteScreen.name);
            },
          ),
        ],
      ),
    );
  }
}
