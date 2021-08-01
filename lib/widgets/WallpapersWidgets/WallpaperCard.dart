import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:legacywallpapers/providers/wallpapers.dart';
import 'package:provider/provider.dart';
import 'package:legacywallpapers/items/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        margin: EdgeInsets.all(25.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            boxShadow: [BoxShadow(blurRadius: 2.0, spreadRadius: 0.5)]),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            clipBehavior: Clip.antiAlias,
            child: CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.cover,
              placeholder: (ctx, _) {
                return Center(
                  child: CircularProgressIndicator(
                    color: pickedColor[
                        Provider.of<Wallpapers>(context).currentIndex]["2"],
                  ),
                );
              },
              errorWidget: (ctx, _, error) {
                return Padding(
                  padding: EdgeInsets.all(deviceSize.width * 0.05),
                  child: Center(
                      child: Text(
                    'Error Occurred, Reload the page!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: deviceSize.width * 0.05),
                  )),
                );
              },
            )),
      ),
    );
  }
}
