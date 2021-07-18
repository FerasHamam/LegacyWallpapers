import 'package:flutter/material.dart';
import 'package:legacywallpapers/providers/wallpapers.dart';
import 'package:provider/provider.dart';
//widgets
import 'TypeCard.dart';

class TypePageView extends StatelessWidget {
  //function to build cards
  List<Widget> companyCardWidget(List<String> types) {
    final List<Widget> _listOfTypes = [];
    types.forEach(
      (type) {
        _listOfTypes.add(
          TypeCard(type),
        );
      },
    );
    return _listOfTypes;
  }
  //

  @override
  Widget build(BuildContext context) {
    //initial values
    final PageController _controller = PageController();
    final types = Provider.of<Wallpapers>(context, listen: false).types;
    //

    return PageView(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      children: companyCardWidget(types),
      physics: BouncingScrollPhysics(),
      onPageChanged: (index) {
        Provider.of<Wallpapers>(context, listen: false).setIndex(index);
      },
    );
  }
}
