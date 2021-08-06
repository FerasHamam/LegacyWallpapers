import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';

class AboutScreen extends StatelessWidget {
  static const name = 'AboutScreen';
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [Color(0xff2CEEF0), Color(0xff0476D0)],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            Container(
                alignment: Alignment.center,
                height: 150.sp,
                width: 200.sp,
                child: Image.asset('lib/assets/images/icon.jpg')),
            Divider(
              thickness: deviceSize.width * 0.005,
              color: Colors.white54,
            ),
            SizedBox(
              height: deviceSize.height * 0.02,
            ),
            Text(
              'ABOUT',
              style: TextStyle(
                  fontFamily: 'Infinity',
                  fontSize: deviceSize.height * 0.055,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              width: 100,
              child: Divider(
                  thickness: deviceSize.width * 0.005, color: Colors.white54),
            ),
            Container(
              margin: EdgeInsets.all(deviceSize.height * 0.025),
              width: deviceSize.width,
              child: AutoSizeText(
                '1- All images are provided by Pixabay!',
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Hero',
                    fontSize: deviceSize.height * 0.03,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: EdgeInsets.all(deviceSize.height * 0.025),
              width: deviceSize.width,
              child: AutoSizeText(
                '2- The app is free to use with no constraints!',
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Hero',
                    fontSize: deviceSize.height * 0.032,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Text(
              'Contact',
              style: TextStyle(
                  fontFamily: 'Infinity',
                  fontSize: deviceSize.height * 0.055,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              width: 100,
              child: Divider(
                thickness: deviceSize.width * 0.005,
                color: Colors.white54,
              ),
            ),
            Container(
              margin: EdgeInsets.all(deviceSize.height * 0.025),
              width: deviceSize.width,
              child: Text(
                'Email : \nferas.i.hamam@gmail.com',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Hero',
                    fontSize: deviceSize.height * 0.03,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
