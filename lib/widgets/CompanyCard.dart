import 'package:flutter/material.dart';
//screens
import '../screens/WallpaperScreen.dart';

class CompanyCard extends StatefulWidget {
  final String companyName;

  CompanyCard(this.companyName);
  @override
  _CompanyCardState createState() => _CompanyCardState();
}

class _CompanyCardState extends State<CompanyCard> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(WallpaperScreen.name),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/images/${widget.companyName}.jpg'),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(15),
          color: Colors.blue,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              spreadRadius: 4,
              color: Colors.black12,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        margin: EdgeInsets.only(
            top: deviceSize.height * 0.05,
            right: deviceSize.width * 0.05,
            left: deviceSize.width * 0.05),
        height: deviceSize.height * 0.6,
        width: deviceSize.width * 0.7,
      ),
    );
  }
}
