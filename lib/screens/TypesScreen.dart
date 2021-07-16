import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//providers
import '../providers/types.dart';
//items
import '../items/colors.dart';
//widgets
import '../widgets/TypeWidgets/TypePageView.dart';
import '../widgets/TypeWidgets/TypeName.dart';
import '../widgets/TypeWidgets/AppbarWidget.dart';

class TypesScreen extends StatefulWidget {
  static String name = 'TypesScreen';
  @override
  _TypesScreenState createState() => _TypesScreenState();
}

class _TypesScreenState extends State<TypesScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    super.initState();
  }

  @override
  void didUpdateWidget(TypesScreen oldWidget) {
    _controller.forward();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<Types>(
        builder: (ctx, companies, ch) {
          List<Color> _colorsChosen = [
            pickedColor[companies.currentIndex]['1']!,
            pickedColor[companies.currentIndex]['2']!
          ];
          return AnimatedContainer(
            duration: Duration(milliseconds: 150),
            curve: Curves.easeInOutQuart,
            height: deviceSize.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: _colorsChosen),
            ),
            child: ch,
          );
        },
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top * 0.9,
            ),
            AppbarWidget(),
            Divider(
              height: deviceSize.height * 0.001,
              thickness: 2,
              color: Color(0x33ffffff),
            ),
            SizedBox(
              height: deviceSize.height * 0.05,
            ),
            Consumer<Types>(
              builder: (ctx, types, _) {
                return Container(
                    child:
                        AnimatedText(types.types[types.currentIndex].typeName));
              },
            ),
            Flexible(child: TypePageView()),
          ],
        ),
      ),
    );
  }
}
