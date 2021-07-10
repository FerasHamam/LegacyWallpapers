import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  final String text;
  AnimatedText(this.text);

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with TickerProviderStateMixin {
  String name = 'Samsung';
  late AnimationController _controller;

  late Animation<double> _animOpacity;

  late Animation<Offset> _animPosition;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _animOpacity = Tween<double>(begin: 0, end: 0.9).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCirc),
    );
    _animPosition = Tween<Offset>(begin: Offset(0, -0.1), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeInOutCirc));
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AnimatedText oldWidget) {
    if (oldWidget.text != widget.text) {
      _controller.reset();
      _controller.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return FadeTransition(
          opacity: _animOpacity,
          child: SlideTransition(
            position: _animPosition,
            child: Text(
              widget.text,
              key: GlobalKey(),
              style: TextStyle(
                  fontSize: deviceSize.width * 0.15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}
