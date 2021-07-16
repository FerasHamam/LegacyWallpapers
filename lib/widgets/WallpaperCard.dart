import 'package:flutter/material.dart';
//screens
import '../screens/ImagePreviewScreen.dart';

class WallpaperCard extends StatelessWidget {
  final String url;
  WallpaperCard(this.url);
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ImagePreviewScreen.name, arguments: {"url": url});
      },
      child: Container(
        margin: EdgeInsets.all(deviceSize.width * 0.02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.lightBlue,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(url),
          ),
        ),
      ),
    );
  }
}
