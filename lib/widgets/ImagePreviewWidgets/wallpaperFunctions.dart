import 'package:flutter/material.dart';

class FunctionsWidget extends StatefulWidget {
  final Size deviceSize;
  final bool _showAppBar;
  FunctionsWidget(this.deviceSize, this._showAppBar);

  @override
  _FunctionsWidgetState createState() => _FunctionsWidgetState();
}

class _FunctionsWidgetState extends State<FunctionsWidget>
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
    _animPosition = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
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
  void didUpdateWidget(FunctionsWidget oldWidget) {
    if (widget._showAppBar == true) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.deviceSize.height * 0.9,
      child: SlideTransition(
        position: _animPosition,
        child: Container(
          height: widget.deviceSize.height * 0.1,
          width: widget.deviceSize.width,
          color: Colors.black26,
          child: Row(
            children: [
              SizedBox(
                width: widget.deviceSize.width * 0.05,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.done,
                  color: Colors.white,
                  size: widget.deviceSize.width * 0.08,
                ),
                label: Text(
                  "Set As Wallpaper",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: widget.deviceSize.width * 0.04),
                ),
              ),
              SizedBox(
                width: widget.deviceSize.width * 0.3,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_rounded,
                  color: Colors.white,
                  size: widget.deviceSize.width * 0.1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
