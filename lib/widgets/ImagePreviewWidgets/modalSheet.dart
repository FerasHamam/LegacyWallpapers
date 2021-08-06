import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';

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
            TextStyle(fontSize: 55.sp, color: Colors.white);
        return Container(
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(
              horizontal: deviceSize.width * 0.1,
              vertical: deviceSize.height * 0.15),
          height: deviceSize.height,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  spreadRadius: 4,
                  color: Colors.black12,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
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
                  label: AutoSizeText(
                    'Home Screen',
                    maxLines: 1,
                    maxFontSize: 20,
                    style: styleForModal,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: deviceSize.width * 0.2),
                  child: Divider(
                    color: Colors.white54,
                    thickness: 2,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setWallpaper('lock');
                  },
                  icon: Icon(
                    Icons.lock_rounded,
                    color: Colors.white,
                  ),
                  label: AutoSizeText(
                    'Lock Screen',
                    maxLines: 1,
                    maxFontSize: 20,
                    style: styleForModal,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: deviceSize.width * 0.2),
                  child: Divider(
                    color: Colors.white54,
                    thickness: 2,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setWallpaper('both');
                  },
                  child: Container(
                    width: deviceSize.width * 0.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_work_rounded,
                          color: Colors.white,
                        ),
                        Icon(Icons.lock_rounded, color: Colors.white),
                        SizedBox(
                          width: deviceSize.width * 0.02,
                        ),
                        AutoSizeText(
                          'Both',
                          maxLines: 1,
                          maxFontSize: 20,
                          style: styleForModal,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: deviceSize.width * 0.2,
                      vertical: deviceSize.height * 0.001),
                  child: Divider(
                    color: Colors.white54,
                    thickness: 2,
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
