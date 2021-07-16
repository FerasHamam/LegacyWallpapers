import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
//items
import '../items/Type.dart';

class Types with ChangeNotifier {
  List<Type> _types = [
    Type(typeName: 'AMOLED'),
    Type(typeName: 'NATURE'),
  ];
  int currentIndex = 0;
  List<Type> get types {
    return [..._types];
  }

  void setIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
