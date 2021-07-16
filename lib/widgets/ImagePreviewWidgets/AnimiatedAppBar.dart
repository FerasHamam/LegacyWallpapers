import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnimatedAppBar extends StatefulWidget {
  final bool _showAppBar;
  AnimatedAppBar(this._showAppBar);
  @override
  _AnimatedAppBarState createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar>
    with TickerProviderStateMixin {
  late Animation<Offset> _animPosition;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 70),
    );
    _animPosition = Tween<Offset>(begin: Offset(0, -1), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AnimatedAppBar oldWidget) {
    if (widget._showAppBar == true) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return SlideTransition(
      position: _animPosition,
      child: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.bottomLeft,
        child: IconButton(
          onPressed: () {
            SystemChrome.setEnabledSystemUIOverlays(
                [SystemUiOverlay.bottom, SystemUiOverlay.top]);
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            size: deviceSize.width * 0.08,
            color: Colors.white,
          ),
        ),
        color: Colors.black26,
        width: deviceSize.width,
        height: deviceSize.height * 0.12,
      ),
    );
  }
}
