import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//items
import '../items/company.dart';

class Companies with ChangeNotifier {
  List<Company> _companies = [];
  List<Company> get companies {
    return [..._companies];
  }

  Future<void> fetchAndSet() async {
    try {
      final data =
          await FirebaseFirestore.instance.collection('companies').get();
      _companies = data.docs.map((item) {
        return Company(
            companyName: item.data()['name'],
            companyColor: Color.fromRGBO(item.data()['red'],
                item.data()['green'], item.data()['blue'], 1));
      }).toList();
    } catch (error) {
      print(error);
    }
  }
}
