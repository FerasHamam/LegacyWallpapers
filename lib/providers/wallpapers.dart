import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
//firebase

//items
import '../items/wallpaper.dart';

class Wallpapers with ChangeNotifier {
  List<Wallpaper> _walls = [];

  List<Wallpaper> get walls {
    return [..._walls];
  }

  Future<void> fetchAndSet() async {
    return;
  }
}
