import 'package:flutter/material.dart';
import 'package:legacywallpapers/providers/wallpapers.dart';
import 'package:provider/provider.dart';
import 'package:legacywallpapers/items/colors.dart';
//screens
import '../../screens/ImagePreviewScreen.dart';
//items and providers

class WallpaperCard extends StatelessWidget {
  final String url;
  final bool isFav;
  WallpaperCard(this.url, this.isFav);
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ImagePreviewScreen.name,
            arguments: {"url": url, "isFav": isFav});
      },
      child: Container(
        margin: EdgeInsets.all(deviceSize.width * 0.02),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            url,
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
