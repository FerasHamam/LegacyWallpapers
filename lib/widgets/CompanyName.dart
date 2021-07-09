import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//providers
import '../providers/companies.dart';

class CompanyName extends StatelessWidget {
  // late AnimationController _animationController;
  // late Animation<double> _animOpacity;
  // late Animation<Offset> _animPosition;

  @override
  // void initState() {
  //   _animationController = AnimationController(
  //     vsync: this,
  //     duration: Duration(milliseconds: 800),
  //   );
  //   _animOpacity = Tween<double>(begin: 0, end: 0.8).animate(
  //     CurvedAnimation(parent: _animationController, curve: Curves.linear),
  //   );
  //   _animPosition = Tween<Offset>(begin: Offset(0, -0.2), end: Offset.zero)
  //       .animate(CurvedAnimation(
  //           parent: _animationController, curve: Curves.linear));
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _animationController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final index = Provider.of<Companies>(context, listen: false).currentIndex;
    final name = Provider.of<Companies>(context, listen: false)
        .companies[index]
        .companyName;
    return Text(
      name,
      style: TextStyle(fontSize: deviceSize.width * 0.15),
    );
  }
}
