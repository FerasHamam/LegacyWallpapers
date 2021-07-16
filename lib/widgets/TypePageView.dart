import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//itmes
import '../items/Type.dart';
//providers
import '../providers/types.dart';
//widgets
import 'TypeCard.dart';

class TypePageView extends StatelessWidget {
  //function to build cards
  List<Widget> companyCardWidget(List<Type> types) {
    print('object');
    return types
        .map(
          (type) => TypeCard(type.typeName),
        )
        .toList();
  }
  //

  @override
  Widget build(BuildContext context) {
    //initial values
    final PageController _controller = PageController();
    final types = Provider.of<Types>(context, listen: false).types;
    //

    return PageView(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      children: companyCardWidget(types),
      physics: BouncingScrollPhysics(),
      onPageChanged: (index) {
        Provider.of<Types>(context, listen: false).setIndex(index);
      },
    );
  }
}
