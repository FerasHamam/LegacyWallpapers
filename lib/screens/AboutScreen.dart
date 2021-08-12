import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:open_appstore/open_appstore.dart';

class AboutScreen extends StatelessWidget {
  static const name = 'AboutScreen';
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        decoration: BoxDecoration(color: Colors.black
            // gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomLeft,
            //   colors: [Color(0xff2CEEF0), Color(0xff0476D0)],
            // ),
            ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    size: 110.sp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: deviceSize.width * 0.28,
                ),
                Container(
                    alignment: Alignment.center,
                    height: 140.sp,
                    width: 200.sp,
                    child: Image.asset('lib/assets/images/icon.jpg')),
              ],
            ),
            Divider(
              thickness: 6.sp,
              color: Colors.white60,
            ),
            SizedBox(
              height: 50.h,
            ),
            Text(
              'ABOUT',
              style: TextStyle(
                  fontFamily: 'Infinity',
                  fontSize: 125.sp,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              width: 100,
              child: Divider(thickness: 6.sp, color: Colors.white60),
            ),
            Container(
              margin: EdgeInsets.all(25.sp),
              width: deviceSize.width,
              child: AutoSizeText(
                '1- All images are provided by Pixabay!',
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Hero',
                    fontSize: 60.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: EdgeInsets.all(25.sp),
              width: deviceSize.width,
              child: AutoSizeText(
                '2- The app is free to use with no constraints!',
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Hero',
                    fontSize: 60.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Text(
              'Contact',
              style: TextStyle(
                  fontFamily: 'Infinity',
                  fontSize: 125.sp,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              width: 100,
              child: Divider(
                thickness: 6.sp,
                color: Colors.white60,
              ),
            ),
            Container(
              margin: EdgeInsets.all(25.sp),
              width: deviceSize.width,
              child: Text(
                'Email : \nferas.i.hamam@gmail.com',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Hero',
                    fontSize: 60.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 300.h,
            ),
            InkWell(
              onTap: () {
                OpenAppstore.launch(
                    androidAppId: 'com.legacywallpapers.android');
              },
              child: Container(
                margin: EdgeInsets.all(deviceSize.height * 0.01),
                alignment: Alignment.center,
                height: 200.h,
                width: 600.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.sp),
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white, width: 5.sp),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star_border_outlined,
                      size: 130.sp,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                    AutoSizeText(
                      'Rate',
                      maxLines: 1,
                      maxFontSize: 60,
                      style: TextStyle(
                          fontFamily: 'Infinity',
                          fontSize: 125.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
