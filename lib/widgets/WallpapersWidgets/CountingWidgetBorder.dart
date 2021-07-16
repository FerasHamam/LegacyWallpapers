import 'package:flutter/material.dart';

class CountingWidgetBorder extends StatelessWidget {
  final int count;
  CountingWidgetBorder(this.count);
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
        height: deviceSize.height * 0.07,
        width: deviceSize.width * 0.32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.transparent,
          border:
              Border.all(width: deviceSize.width * 0.01, color: Colors.white),
        ),
        child: Center(
          child: Text(
            '$count Wallpapers',
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}
