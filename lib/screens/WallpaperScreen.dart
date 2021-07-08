import 'package:flutter/material.dart';

class WallpaperScreen extends StatefulWidget {
  static const String name = 'WallpapersScreen';

  @override
  _WallpaperScreenState createState() => _WallpaperScreenState();
}

class _WallpaperScreenState extends State<WallpaperScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.transparent,
              ),
              centerTitle: true,
              title: Text('Oui'),
            ),
            pinned: true,
            floating: true,
            snap: true,
            centerTitle: true,
            stretch: true,
            expandedHeight: 160,
          ),
          SliverGrid(
              delegate: SliverChildListDelegate([
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.amber,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.amber,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.amber,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.amber,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.amber,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.amber,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.amber,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.amber,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.amber,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.amber,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.amber,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.amber,
                )
              ]),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisSpacing: 25,
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 9 / 18))
        ],
      ),
    );
  }
}
