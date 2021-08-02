import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
//providers
import '../providers/wallpapers.dart';
//widgets
import '../widgets/WallpapersWidgets/WallpaperCard.dart';

class FavoriteScreen extends StatelessWidget {
  static const name = "FavoritesScreen";
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
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
        title: Container(
          alignment: Alignment.center,
          width: 400.w,
          height: (deviceSize.height * 0.15).h,
          child: AutoSizeText(
            'Your Favorites',
            style: Theme.of(context)
                .appBarTheme
                .textTheme!
                .headline6!
                .copyWith(color: Colors.black54, fontSize: 120.sp),
            maxLines: 1,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: deviceSize.width,
        height: deviceSize.height,
        child: Consumer<Wallpapers>(builder: (ctx, wallpapers, _) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 9 / 20,
              mainAxisExtent: 1000.sp,
              maxCrossAxisExtent: 800.sp,
            ),
            itemBuilder: (ctx, index) {
              return WallpaperCard(
                wallpapers.fav[index]['url'],
                wallpapers.fav[index]['id'],
                wallpapers.fav[index]['name'],
              );
            },
            itemCount: wallpapers.fav.length,
          );
        }),
      ),
    );
  }
}
