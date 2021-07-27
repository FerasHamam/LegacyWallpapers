import 'package:flutter/material.dart';
import '../providers/wallpapers.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    TextStyle style = Theme.of(context)
        .appBarTheme
        .textTheme!
        .headline6!
        .copyWith(fontWeight: FontWeight.bold);
    Provider.of<Wallpapers>(context, listen: false).types.forEach(
      (type) {
        precacheImage(AssetImage("lib/assets/images/$type.jpg"), context);
      },
    );
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'lib/assets/images/initial.jpg',
            ),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: deviceSize.height * 0.08,
                  ),
                  Text('L', textAlign: TextAlign.center, style: style),
                  SizedBox(
                    height: deviceSize.height * 0.08,
                  ),
                  Text('E', textAlign: TextAlign.center, style: style),
                  SizedBox(
                    height: deviceSize.height * 0.08,
                  ),
                  Text(
                    'G',
                    textAlign: TextAlign.center,
                    style: style,
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.08,
                  ),
                  Text('A', textAlign: TextAlign.center, style: style),
                  SizedBox(
                    height: deviceSize.height * 0.08,
                  ),
                  Text(
                    'C',
                    textAlign: TextAlign.center,
                    style: style,
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.08,
                  ),
                  Text(
                    'Y',
                    textAlign: TextAlign.center,
                    style: style,
                  ),
                ],
              ),
            ),
            Center(
                child: CircularProgressIndicator(
              strokeWidth: 5,
              color: Colors.cyan,
            )),
          ],
        ),
      ),
    );
  }
}
