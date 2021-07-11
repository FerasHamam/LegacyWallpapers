import 'package:flutter/material.dart';

class WallpaperCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(deviceSize.width * 0.02),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.lightBlue),
    );
  }
}
