import 'package:flutter/material.dart';
//providers
//widgets
import '../widgets/CompanyPageView.dart';
import '../widgets/CompanyName.dart';

class CompanyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: deviceSize.height,
        color: Colors.amber,
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top * 5,
          ),
          CompanyName(),
          Flexible(
            child: CompanyPageView(),
          ),
        ]),
      ),
    );
  }
}
