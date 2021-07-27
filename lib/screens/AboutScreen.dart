import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const name = 'AboutScreen';
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        color: Colors.black,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('lib/assets/images/initial.jpg'),
        //     fit: BoxFit.fill,
        //   ),
        // ),
        child: Column(
          children: [
            SizedBox(
              height: deviceSize.height * 0.05,
            ),
            Text(
              'ABOUT',
              style: TextStyle(
                  fontFamily: 'Infinity',
                  fontSize: deviceSize.height * 0.065,
                  fontWeight: FontWeight.w600),
            ),
            Divider(
              thickness: deviceSize.width * 0.005,
              color: Colors.white,
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
            Container(
              margin: EdgeInsets.all(deviceSize.height * 0.025),
              width: deviceSize.width,
              child: Text(
                '3- This is my first app so, it may or\n may not have miner bugs. Please\n contact me if you find any !',
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
            Divider(
              thickness: deviceSize.width * 0.005,
              color: Colors.white,
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
