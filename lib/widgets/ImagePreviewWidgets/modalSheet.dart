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
        TextStyle styleForModal =
            TextStyle(fontSize: deviceSize.width * 0.06, color: Colors.white);
        return Container(
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(
              horizontal: deviceSize.width * 0.1,
              vertical: deviceSize.height * 0.15),
          height: deviceSize.height,
          child: Card(
            color: Colors.black54,
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
                    color: Colors.white,
                  ),
                  label: Text(
                    'Home Screen',
                    style: styleForModal,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: deviceSize.width * 0.2),
                  child: Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setWallpaper('lock');
                  },
                  icon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Lock Screen',
                    style: styleForModal,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: deviceSize.width * 0.2),
                  child: Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setWallpaper('both');
                  },
                  child: Text(
                    'Both',
                    style: styleForModal,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: deviceSize.width * 0.2),
                  child: Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
