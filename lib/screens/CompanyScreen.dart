import 'package:flutter/material.dart';
//providers
//widgets
import '../widgets/CompanyPageView.dart';

class CompanyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: deviceSize.height,
        color: Colors.amber,
        child: CompanyPageView(),
      ),
    );
  }
}
