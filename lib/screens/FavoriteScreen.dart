import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//providers
import '../providers/wallpapers.dart';
//widgets
import '../widgets/WallpapersWidgets/WallpaperCard.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        centerTitle: true,
      ),
      body: Container(
        width: deviceSize.width,
        height: deviceSize.height,
        child: Consumer<Wallpapers>(builder: (ctx, wallpapers, _) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 10 / 20,
                mainAxisExtent: deviceSize.height * 0.4,
                maxCrossAxisExtent: deviceSize.width * 0.5,
                crossAxisSpacing: deviceSize.width * 0.03,
                mainAxisSpacing: deviceSize.height * 0.015),
            itemBuilder: (ctx, index) {
              return WallpaperCard(wallpapers.fav[index], false);
            },
          );
        }),
      ),
    );
  }
}
