import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                colors: [Colors.cyan, Colors.teal])),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            Container(
                alignment: Alignment.center,
                height: 150.sp,
                width: 250.sp,
                child: Image.asset('lib/assets/images/icon.jpg')),
            Divider(
              thickness: deviceSize.width * 0.005,
              color: Color(0xffB77CFC),
            ),
            SizedBox(
              height: deviceSize.height * 0.02,
            ),
            Text(
              'ABOUT',
              style: TextStyle(
                  fontFamily: 'Infinity',
                  fontSize: deviceSize.height * 0.065,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              width: 100,
              child: Divider(
                thickness: deviceSize.width * 0.005,
                color: Color(0x99B77CFC),
              ),
            ),
            Container(
              margin: EdgeInsets.all(deviceSize.height * 0.025),
              width: deviceSize.width,
              child: Text(
                '1- All images are provided by Pixaby !',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Hero',
                    fontSize: deviceSize.height * 0.025,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: EdgeInsets.all(deviceSize.height * 0.025),
              width: deviceSize.width,
              child: Text(
                '2- The app is free to use with no\n constraints !',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Hero',
                    fontSize: deviceSize.height * 0.025,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Text(
              'Contact',
              style: TextStyle(
                  fontFamily: 'Infinity',
                  fontSize: deviceSize.height * 0.065,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              width: 100,
              child: Divider(
                thickness: deviceSize.width * 0.005,
                color: Color(0x99B77CFC),
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
