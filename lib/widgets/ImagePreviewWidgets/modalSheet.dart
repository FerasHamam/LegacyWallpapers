import 'package:flutter/material.dart';

void showMoadl(
  BuildContext context,
  Size deviceSize,
  Function setWallpaper,
) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (ctx) {
        return Container(
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(
              horizontal: deviceSize.width * 0.1,
              vertical: deviceSize.height * 0.15),
          height: deviceSize.height,
          child: Card(
            color: Colors.black45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setWallpaper('home');
                  },
                  icon: Icon(
                    Icons.home_work_rounded,
                  ),
                  label: Text(
                    'Home Screen',
                    style: TextStyle(fontSize: deviceSize.width * 0.06),
                    textAlign: TextAlign.center,
                  ),
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
                TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setWallpaper('lock');
                  },
                  icon: Icon(Icons.lock),
                  label: Text(
                    'Lock Screen',
                    style: TextStyle(fontSize: deviceSize.width * 0.06),
                    textAlign: TextAlign.center,
                  ),
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1.3,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setWallpaper('both');
                  },
                  child: Text(
                    'Both',
                    style: TextStyle(fontSize: deviceSize.width * 0.06),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
