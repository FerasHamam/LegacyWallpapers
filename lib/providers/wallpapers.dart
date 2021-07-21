import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Wallpapers with ChangeNotifier {
  //types for types screen => prepare
  List<String> _types = [
    'abstract',
    'ocean',
    'forest',
    'mountain',
    'fantasy',
    'animal',
    'car',
    'city',
    'sci fi',
  ];

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
  List<Map<String, Object?>> _fav = [];
  List<Map<String, Object?>> get fav {
    return [..._fav];
  }

  String favDbName = 'FAV';
  //handle favorite feature in database
  void databaseFav(bool isFav, int id, String url, String user) async {
    final path = await getApplicationDocumentsDirectory();
    String dbPath = join(path.path, 'fav.db');
    final db = await sql.openDatabase(
      dbPath,
      version: 1,
      onOpen: (db) async {
        if (isFav) {
          await db.insert(
              favDbName, {'id': id, 'url': url, 'isFav': 1, 'user': user},
              conflictAlgorithm: sql.ConflictAlgorithm.replace);
        } else {
          await db.delete(favDbName, where: 'id = $id');
        }
      },
    );
    db.close();
  }

  //
  //handle favorite feature locally
  void setFav(String url, int id, String user) async {
    _fav.add({'id': id, 'url': url, 'isFav': 1, 'user': user});
    notifyListeners();
    databaseFav(true, id, url, user);
  }

  void deleteFav(String url, int id, String user) async {
    _fav.removeWhere((wallpaper) => wallpaper['id'] == id);
    notifyListeners();
    databaseFav(false, id, url, user);
  }

  bool containsFav(String url, int id) {
    print(id);

    bool isFav = false;
    _fav.forEach(
      (fav) {
        print('oui');
        if (fav['id'] == id) {
          isFav = true;
          return;
        }
      },
    );
    return isFav;
  }
  //
  //

  //fetch data from cloud
  Future<void> fetchData() async {
    //fav
    List<Map<String, Object?>> favList = [];
    final path = await getApplicationDocumentsDirectory();
    String dbPath = join(path.path, 'fav.db');
    final db = await sql.openDatabase(dbPath, version: 1,
        onCreate: (db, version) async {
      await db.execute(
          '''CREATE TABLE $favDbName(id INTEGER PRIMARY KEY, url TEXT, isFav INTEGER, user TEXT)''');
    }, onOpen: (db) async {
      favList = await db
          .rawQuery('Select * From $favDbName'); //fav list that the app use
    });
    await db.close();
    favList.forEach((item) {
      _fav.add(item);
    });
    //
    if (_types.length > 0)
      _types.forEach(
        (type) async {
          final response = await http.get(
            Uri.parse(
              'https://pixabay.com/api/?key=22575208-3109e2dc674cc85adb78b73af&q=$type+wallpaper&orientation=vertical&per_page=20min_width=1019&min_height=1080',
            ),
          );
          final result = jsonDecode(response.body);
          List<dynamic> hits = result['hits'];
          hits.forEach(
            (wallpaper) {
              _walls.putIfAbsent(type, () => []);
              _walls[type]?.add(
                {
                  'url': wallpaper['largeImageURL'] ?? "",
                  'id': wallpaper['id'],
                  'name': wallpaper['user'] ?? "",
                },
              );
            },
          );
        },
      );
    notifyListeners();
    await Future.delayed(Duration(seconds: 5), () {
      notifyListeners();
      return;
    });
  }
}
