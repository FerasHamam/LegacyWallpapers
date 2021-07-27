import 'package:flutter/material.dart';

class CountingWidget extends StatelessWidget {
  final int count;
  CountingWidget(this.count);
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        height: deviceSize.height * 0.082,
        width: deviceSize.width * 0.48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black54,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              spreadRadius: 4,
              color: Colors.black12,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Text(
          '$count Wallpapers',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Hero',
            fontWeight: FontWeight.bold,
            fontSize: deviceSize.height * 0.024,
          ),
        ));
  }
}
