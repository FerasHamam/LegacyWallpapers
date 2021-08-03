// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../providers/wallpapers.dart';
import '../screens/Initial.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//widgets
import '../widgets/WallpapersWidgets/WallpaperCard.dart';
import '../widgets/WallpapersWidgets/CountingWidgetBorder.dart';

class WallpapersScreen extends StatefulWidget {
  static String name = 'WallpapersScreen';
  @override
  _WallpapersScreenState createState() => _WallpapersScreenState();
}

class _WallpapersScreenState extends State<WallpapersScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Wallpapers>(context, listen: false);
    Size deviceSize = MediaQuery.of(context).size;
    final _index = provider.currentIndex;
    final String _currentTypeName = provider.types[_index].keys.first;
    final List<Map<String, Object>> wallpapers =
        Provider.of<Wallpapers>(context).walls[_currentTypeName] ?? [];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: deviceSize.height * 0.06,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_sharp,
            size: 100.sp,
            color: Colors.black54,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        title: Container(
          alignment: Alignment.center,
          width: (_currentTypeName.length * 40).w,
          height: (deviceSize.height * 0.14).h,
          child: AutoSizeText(
            _currentTypeName.toUpperCase(),
            style: TextStyle(color: Colors.black54, fontSize: 110.sp),
            maxLines: 1,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(Initial.name);
              },
              icon: Icon(
                Icons.replay_sharp,
                size: 100.sp,
                color: Colors.black54,
              ))
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Container(),
            floating: false,
            centerTitle: true,
            expandedHeight: deviceSize.height * 0.2,
            flexibleSpace: Container(
              height: deviceSize.height * 0.2,
              padding: EdgeInsets.only(
                  top: deviceSize.height * 0.07,
                  bottom: deviceSize.height * 0.07,
                  left: deviceSize.width * 0.3,
                  right: deviceSize.width * 0.3),
              child: CountingWidgetBorder(wallpapers.length),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("lib/assets/images/$_currentTypeName.jpg"),
                ),
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (ctx, index) {
                final wallpaper = wallpapers[index];
                String url = wallpaper['url'].toString();
                final id = wallpaper['id'];
                String user = wallpaper['name'].toString();
                return WallpaperCard(url, id, user);
              },
              childCount: wallpapers.length,
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 9 / 20,
              mainAxisExtent: 1000.sp,
              maxCrossAxisExtent: 700.sp,
            ),
          ),
        ],
      ),
    );
  }
}
