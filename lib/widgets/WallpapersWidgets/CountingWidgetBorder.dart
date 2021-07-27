import 'package:flutter/material.dart';

class CountingWidgetBorder extends StatelessWidget {
  final int count;
  CountingWidgetBorder(this.count);
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(deviceSize.height * 0.005),
      height: deviceSize.height * 0.082,
      width: deviceSize.width * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent,
        border: Border.all(width: deviceSize.width * 0.01, color: Colors.white),
      ),
      child: Text(
        '$count Wallpapers',
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'Hero',
            fontWeight: FontWeight.bold,
            fontSize: deviceSize.height * 0.022),
      ),
    );
  }
}
