import 'package:flutter/material.dart';
import 'package:legacywallpapers/providers/wallpapers.dart';
import 'package:provider/provider.dart';
import 'package:preload_page_view/preload_page_view.dart';
//widgets
import 'TypeCard.dart';

class TypePageView extends StatelessWidget {
  final reload;
  TypePageView(this.reload);
  //function to build cards
  List<Widget> companyCardWidget(List<String> types) {
    final List<Widget> _listOfTypes = [];
    types.forEach(
      (type) {
        _listOfTypes.add(
          TypeCard(type, reload),
        );
      },
    );
    return _listOfTypes;
  }
  //

  @override
  Widget build(BuildContext context) {
    //initial values
    final PreloadPageController _controller =
        PreloadPageController(keepPage: true);
    final types = Provider.of<Wallpapers>(context, listen: false).types;
    //
    return PreloadPageView(
      preloadPagesCount: 5,
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
