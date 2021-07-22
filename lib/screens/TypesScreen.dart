import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//providers
import '../providers/wallpapers.dart';
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
      duration: Duration(milliseconds: 80),
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
    final walls = Provider.of<Wallpapers>(context, listen: false).walls;
    bool reload = true;
    print(walls.length);
    if (walls.length > 0) {
      setState(() {
        reload = false;
      });
    }
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<Wallpapers>(
        builder: (ctx, provider, ch) {
          List<Color> _colorsChosen = [
            pickedColor[provider.currentIndex]['1']!,
            pickedColor[provider.currentIndex]['2']!
          ];
          return AnimatedContainer(
            duration: const Duration(milliseconds: 80),
            curve: Curves.easeInExpo,
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
              color: const Color(0x77ffffff),
            ),
            SizedBox(
              height: deviceSize.height * 0.05,
            ),
            Consumer<Wallpapers>(
              builder: (ctx, provider, _) {
                return Container(
                  child: AnimatedText(provider.types[provider.currentIndex]),
                );
              },
            ),
            Flexible(child: TypePageView(reload)),
          ],
        ),
      ),
    );
  }
}
