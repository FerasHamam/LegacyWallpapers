import 'package:flutter/material.dart';
import 'package:legacywallpapers/providers/wallpapers.dart';
import 'package:legacywallpapers/screens/Initial.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//screens
import '../../screens/WallpapersScreen.dart';
//widget
import 'CountingWidget.dart';

class TypeCard extends StatelessWidget {
  final String name;
  final reload;
  TypeCard(this.name, this.reload);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    final provider =
        Provider.of<Wallpapers>(context, listen: false).walls[name];

    return GestureDetector(
      onTap: () {
        if (!reload) Navigator.of(context).pushNamed(WallpapersScreen.name);
      },
      child: Container(
        padding: EdgeInsets.only(top: deviceSize.height * 0.4),
        child: Center(
          child: reload == false
              ? CountingWidget(provider == null ? 0 : provider.length)
              : IconButton(
                  padding: EdgeInsets.only(
                      right: deviceSize.width * 0.12,
                      bottom: deviceSize.height * 0.3),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(Initial.name);
                  },
                  icon: Icon(
                    Icons.replay_sharp,
                    size: deviceSize.width * 0.2,
                    color: Colors.white,
                  )),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/images/$name.jpg'),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(30.sp),
          boxShadow: [
            BoxShadow(
              blurRadius: 10.sp,
              spreadRadius: 2.sp,
              color: Colors.black45,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        margin: EdgeInsets.only(
            top: 100.sp, right: 125.sp, left: 125.sp, bottom: 50.sp),
      ),
    );
  }
}
