// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//screens
import 'package:legacywallpapers/screens/AboutScreen.dart';
import 'package:legacywallpapers/screens/FavoriteScreen.dart';

class AppbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      width: deviceSize.width,
      height: deviceSize.height * 0.05,
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(
        top: (deviceSize.height * 0.03).h,
        right: (deviceSize.width * 0.02).w,
        left: (deviceSize.width * 0.02).w,
        bottom: (deviceSize.height * 0.01).h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            padding: EdgeInsets.only(bottom: 265.sp),
            icon: Icon(Icons.details_sharp,
                color: Color(0xccffffff), size: 110.sp),
            onPressed: () {
              Navigator.of(context).pushNamed(AboutScreen.name);
            },
          ),
          SizedBox(
            width: (deviceSize.width * 0.55).w,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            width: (deviceSize.width * 0.32),
            height: (deviceSize.height * 0.15).h,
            child: AutoSizeText(
              'L E G A C Y',
              maxLines: 1,
              style:
                  Theme.of(context).appBarTheme.textTheme!.headline6!.copyWith(
                        fontSize: 200.sp,
                      ),
            ),
          ),
          SizedBox(
            width: (deviceSize.width * 0.55).w,
          ),
          IconButton(
            padding: EdgeInsets.only(bottom: 265.sp),
            icon: Icon(Icons.favorite_border_sharp,
                color: Color(0xccffffff), size: 110.sp),
            onPressed: () {
              Navigator.of(context).pushNamed(FavoriteScreen.name);
            },
          ),
        ],
      ),
    );
  }
}
