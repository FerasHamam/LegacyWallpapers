import 'package:flutter/material.dart';
//aws
import 'package:cloud_firestore/cloud_firestore.dart';

class Wallpapers with ChangeNotifier {
  List<String> _amoled = [];
  List<String> _nature = [];
  get amoled {
    return [..._amoled];
  }

  get nature {
    return [..._nature];
  }

  List<String> typeName(String type) {
    if (type.toLowerCase() == "amoled")
      return amoled;
    else if (type.toLowerCase() == "nature") return nature;
    return [];
  }

  Future<void> fetchData() async {
    QuerySnapshot<Map<String, dynamic>> amoled =
        await FirebaseFirestore.instance.collection("AMOLED").get();
    QuerySnapshot<Map<String, dynamic>> nature =
        await FirebaseFirestore.instance.collection("NATURE").get();
    amoled.docs.forEach(
      (doc) {
        _amoled.add(doc['url']);
      },
    );
    nature.docs.forEach(
      (doc) {
        _nature.add(doc['url']);
      },
    );

    notifyListeners();
    return;
  }
}
