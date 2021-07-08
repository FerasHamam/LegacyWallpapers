import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  final String name;
  final bool changed;
  AnimatedText(this.name, this.changed);
  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with TickerProviderStateMixin {
  late Animation<Offset> _animOffset;
  late Animation<double> _animOpacity;
  late AnimationController _animController;
  @override
  void initState() {
    _animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    final curve =
        CurvedAnimation(parent: _animController, curve: Curves.easeInExpo);

    _animOffset =
        Tween<Offset>(begin: Offset(0, -0.1), end: Offset.zero).animate(curve);
    _animOpacity = Tween<double>(
      begin: 0,
      end: 0.8,
    ).animate(curve);
    super.initState();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.changed)
      setState(() {
        _animController.forward();
      });
    return SlideTransition(
      position: _animOffset,
      child: FadeTransition(
        opacity: _animOpacity,
        child: Text(
          widget.name,
          style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
