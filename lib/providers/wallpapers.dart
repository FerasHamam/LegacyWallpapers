import 'package:flutter/material.dart';
//firestore
import 'package:cloud_firestore/cloud_firestore.dart';

class Wallpapers with ChangeNotifier {
  //types for types screen => prepare
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

  //wallpapers => prepare
  Map<String, List<Map<String, Object>>> _walls = {};
  Map<String, List<Map<String, Object>>> get walls {
    return _walls;
  }
  //

  //Favorite
  List<Map<String, String>> _fav = [];
  List<Map<String, String>> get fav {
    return [..._fav];
  }

  //handle favorite feature in database
  void databaseFav(bool isFav, String id) async {
    final QuerySnapshot<Map<String, dynamic>> wallpapers =
        await FirebaseFirestore.instance.collection("wallpapers").get();
    final wallpaper =
        wallpapers.docs.firstWhere((wallpaper) => wallpaper.id == id);
    wallpaper.reference.update({'isFav': isFav});
  }

  //
  //handle favorite feature locally
  void setFav(String url, String id) async {
    _fav.add({id: url});
    notifyListeners();
    databaseFav(true, id);
  }

  void deleteFav(String url, id) async {
    _fav.removeWhere((wallpaper) => wallpaper[id] == url);
    notifyListeners();
    databaseFav(false, id);
  }

  bool containsFav(String url, String id) {
    bool _isFav = false;
    if (_fav.isEmpty) return false;
    _fav.firstWhere((favWallpaper) {
      _isFav = favWallpaper.containsKey(id) == true;
      return _isFav;
    }, orElse: () => {});
    return _isFav;
  }
  //
  //

  //fetch data from cloud
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
        String name = wallpaperData['type'].toString().toLowerCase();
        final isFav = wallpaperData['isFav'];
        final url = wallpaperData['url'];
        final id = wallpaper.id;
        _walls.putIfAbsent(name, () => []);
        _walls[name]?.add({'url': url, 'isFav': isFav, 'id': id});
        if (isFav) {
          _fav.add(
            {id: url},
          );
        }
      },
    );
    notifyListeners();
    return;
  }
}
