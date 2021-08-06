import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';

class AnimatedText extends StatefulWidget {
  final String text;
  AnimatedText(this.text);

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with TickerProviderStateMixin {
  String name = 'Fantasy';
  late AnimationController _controller;

  late Animation<double> _animOpacity;

  late Animation<Offset> _animPosition;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _animOpacity = Tween<double>(begin: 0, end: 0.8).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCirc),
    );
    _animPosition = Tween<Offset>(begin: Offset(0, -0.2), end: Offset.zero)
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
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return FadeTransition(
          opacity: _animOpacity,
          child: SlideTransition(
            position: _animPosition,
            child: AutoSizeText(
              widget.text.toUpperCase(),
              maxLines: 1,
              maxFontSize: 60,
              key: GlobalKey(),
              style: TextStyle(
                  fontSize: 300.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w800),
            ),
          ),
        );
      },
    );
  }
}
