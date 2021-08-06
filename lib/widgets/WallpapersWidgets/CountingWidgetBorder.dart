// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountingWidgetBorder extends StatelessWidget {
  final int count;
  CountingWidgetBorder(this.count);
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(25.sp),
      height: 150.sp,
      width: 420.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent,
        border: Border.all(width: deviceSize.width * 0.01, color: Colors.white),
      ),
      child: AutoSizeText(
        '$count Wallpapers',
        maxLines: 1,
        maxFontSize: 18,
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'Hero',
            fontWeight: FontWeight.bold,
            fontSize: 62.sp),
      ),
    );
  }
}
