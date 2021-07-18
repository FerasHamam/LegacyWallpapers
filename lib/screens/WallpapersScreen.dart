import 'package:flutter/material.dart';
import 'package:legacywallpapers/providers/wallpapers.dart';
import 'package:provider/provider.dart';
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
    final String _currentTypeName = provider.types[_index];
    final List<Map<String, Object>> wallpapers =
        Provider.of<Wallpapers>(context).walls[_currentTypeName] ?? [];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_sharp,
            size: deviceSize.width * 0.09,
            color: Colors.black45,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        title: Text(
          _currentTypeName.toUpperCase(),
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
        actions: [],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Container(),
            floating: true,
            centerTitle: true,
            expandedHeight: deviceSize.height * 0.2,
            flexibleSpace: Container(
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
                  String url = wallpapers[index]['url'].toString();
                  bool isFav = wallpapers[index]['isFav'] == true;
                  return WallpaperCard(url, isFav);
                },
                childCount: wallpapers.length,
              ),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 10 / 20,
                  mainAxisExtent: deviceSize.height * 0.4,
                  maxCrossAxisExtent: deviceSize.width * 0.5,
                  crossAxisSpacing: deviceSize.width * 0.03,
                  mainAxisSpacing: deviceSize.height * 0.015)),
        ],
      ),
    );
  }
}
