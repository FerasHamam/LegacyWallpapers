import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
            size: deviceSize.width * 0.09,
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
              .copyWith(color: Colors.black54),
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
              childAspectRatio: 10 / 20,
              mainAxisExtent: deviceSize.height * 0.4,
              maxCrossAxisExtent: deviceSize.width * 0.5,
            ),
            itemBuilder: (ctx, index) {
              return WallpaperCard(wallpapers.fav[index].values.first,
                  wallpapers.fav[index].keys.first);
            },
            itemCount: wallpapers.fav.length,
          );
        }),
      ),
    );
  }
}
