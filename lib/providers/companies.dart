import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
//items
import '../items/company.dart';

class Companies with ChangeNotifier {
  List<Company> _companies = [Company(companyName: 'Samsung')];
  int currentIndex = 0;
  List<Company> get companies {
    return [..._companies];
  }

  void setIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  Future<void> fetchAndSet() async {
    try {
      final data =
          await FirebaseFirestore.instance.collection('companies').get();
      _companies = data.docs.map((item) {
        return Company(
          companyName: item.data()['name'],
        );
      }).toList();
    } catch (error) {
      print(error);
    }
  }
}
