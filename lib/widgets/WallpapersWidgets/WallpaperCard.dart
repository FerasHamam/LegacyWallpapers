import 'package:flutter/material.dart';
import 'package:legacywallpapers/providers/wallpapers.dart';
import 'package:provider/provider.dart';
import 'package:legacywallpapers/items/colors.dart';
//screens
import '../../screens/ImagePreviewScreen.dart';
//items and providers

class WallpaperCard extends StatelessWidget {
  final url;
  final id;
  final user;
  WallpaperCard(this.url, this.id, this.user);
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ImagePreviewScreen.name,
            arguments: {"url": url, "id": id, "user": user});
      },
      child: Container(
        margin: EdgeInsets.all(deviceSize.width * 0.04),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.transparent),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          clipBehavior: Clip.antiAlias,
          child: Image.network(
            url,
            fit: BoxFit.cover,
            loadingBuilder: (ctx, image, loadingProgress) {
              if (loadingProgress != null)
                return Center(
                  child: CircularProgressIndicator(
                    color: pickedColor[
                        Provider.of<Wallpapers>(context).currentIndex]["2"],
                  ),
                );
              return image;
            },
            errorBuilder: (ctx, exception, stacktrace) {
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
