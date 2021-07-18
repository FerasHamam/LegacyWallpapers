import 'package:flutter/material.dart';
//firestore
import 'package:cloud_firestore/cloud_firestore.dart';

class Wallpapers with ChangeNotifier {
  //types
  List<String> _types = [];
  addType(String name) {
    types.add(name);
  }

  List<String> get types {
    return [..._types];
  }

  int currentIndex = 0;

  void setIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
  //

  //wallpapers
  Map<String, List<Map<String, Object>>> _walls = {};
  Map<String, List<Map<String, Object>>> get walls {
    return _walls;
  }
  //

  //Favorite
  List<String> _fav = [];
  List<String> get fav {
    return [..._fav];
  }

  bool setFav(String url) {
    _fav.add(url);
    notifyListeners();
    return true;
  }

  bool deleteFav(String url) {
    _fav.removeWhere((wallpaper) => wallpaper == url);
    notifyListeners();
    return false;
  }
  //

  //fetch
  Future<void> fetchData() async {
    QuerySnapshot<Map<String, dynamic>> types =
        await FirebaseFirestore.instance.collection("types").get();
    types.docs.forEach((type) {
      _types.add(type['name'].toString().toLowerCase());
    });
    QuerySnapshot<Map<String, dynamic>> wallpapers =
        await FirebaseFirestore.instance.collection("wallpapers").get();
    wallpapers.docs.forEach(
      (wallpaper) {
        final wallpaperData = wallpaper.data();
        _walls.putIfAbsent(
            wallpaperData['type'].toString().toLowerCase(), () => []);
        _walls[wallpaperData['type'].toString().toLowerCase()]?.add(
            {'url': wallpaperData['url'], 'isFav': wallpaperData['isFav']});
      },
    );
    notifyListeners();
    return;
  }
}
