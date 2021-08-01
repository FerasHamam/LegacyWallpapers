import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_sharp,
            size: 110.sp,
            color: Colors.black54,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Your Favorites',
          style: Theme.of(context)
              .appBarTheme
              .textTheme!
              .headline6!
              .copyWith(color: Colors.black54, fontSize: 110.sp),
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
