// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountingWidget extends StatelessWidget {
  final int count;
  CountingWidget(this.count);
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 185.h,
        width: 450.w,
        padding: EdgeInsets.all(24.sp),
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
        child: AutoSizeText(
          '$count Wallpapers',
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Hero',
            fontWeight: FontWeight.bold,
            fontSize: 60.sp,
          ),
        ));
  }
}
