import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.purpleAccent, Colors.blueGrey])),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: deviceSize.height * 0.05,
                  ),
                  Center(
                    child: Text(
                      'L',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).appBarTheme.textTheme?.headline6,
                    ),
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.05,
                  ),
                  Text(
                    'E',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).appBarTheme.textTheme?.headline6,
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.05,
                  ),
                  Text(
                    'G',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).appBarTheme.textTheme?.headline6,
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.05,
                  ),
                  Text(
                    'A',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).appBarTheme.textTheme?.headline6,
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.05,
                  ),
                  Text(
                    'C',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).appBarTheme.textTheme?.headline6,
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.05,
                  ),
                  Text(
                    'Y',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).appBarTheme.textTheme?.headline6,
                  ),
                ],
              ),
            ),
            Center(
                child: CircularProgressIndicator(
              strokeWidth: 5,
              color: Colors.indigo,
            )),
          ],
        ),
      ),
    );
  }
}
