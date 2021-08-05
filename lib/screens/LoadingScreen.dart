import 'package:flutter/material.dart';
import '../providers/wallpapers.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animOpacity;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _animOpacity = Tween<double>(begin: 0.25, end: .95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.decelerate),
    );
    _controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    Provider.of<Wallpapers>(context, listen: false).types.forEach(
      (type) {
        precacheImage(
            AssetImage("lib/assets/images/${type.keys.first}.jpg"), context);
      },
    );
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: deviceSize.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'lib/assets/images/initial.jpg',
            ),
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _animOpacity,
            child: Container(
              margin: MediaQuery.of(context).viewInsets,
              width: 300.w,
              height: 300.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/icon.jpg'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
