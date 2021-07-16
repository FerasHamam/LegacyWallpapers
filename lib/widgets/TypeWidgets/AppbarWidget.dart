import 'package:flutter/material.dart';
//screens

class AppbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: Icon(Icons.favorite,
                color: Color(0xccffffff), size: deviceSize.width * 0.09),
            onPressed: () {},
          ),
          SizedBox(
            width: deviceSize.width * 0.21,
          ),
          Text(
            'L E G A C Y',
            style: Theme.of(context).appBarTheme.textTheme!.headline6,
          ),
          SizedBox(
            width: deviceSize.width * 0.21,
          ),
          IconButton(
            icon: Icon(Icons.menu,
                color: Color(0xccffffff), size: deviceSize.width * 0.09),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
