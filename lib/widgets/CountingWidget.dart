import 'package:flutter/material.dart';

class CountingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
        height: deviceSize.height * 0.07,
        width: deviceSize.width * 0.32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              spreadRadius: 4,
              color: Colors.black12,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Center(
          child: Text(
            '0 Wallpapers',
            style: TextStyle(color: Colors.black),
          ),
        ));
  }
}
