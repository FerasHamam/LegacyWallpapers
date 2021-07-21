import 'package:flutter/material.dart';
import 'package:legacywallpapers/providers/wallpapers.dart';
import 'package:legacywallpapers/widgets/ImagePreviewWidgets/modalSheet.dart';
import 'package:provider/provider.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:wallpaper_manager/wallpaper_manager.dart';
import 'dart:io';

class FunctionsWidget extends StatefulWidget {
  final Size deviceSize;
  final bool _showAppBar;
  final String url;
  final int id;
  final String user;
  FunctionsWidget(
      this.deviceSize, this._showAppBar, this.url, this.id, this.user);

  @override
  _FunctionsWidgetState createState() => _FunctionsWidgetState();
}

class _FunctionsWidgetState extends State<FunctionsWidget>
    with TickerProviderStateMixin {
  late Animation<double> _animOpacity;
  late AnimationController _controller;
  bool _isLoading = false;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 120),
    );
    _animOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.decelerate));
    _controller.forward();
    super.initState();
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

  Future<void> _setWallpaper(String type) async {
    setState(() {
      _isLoading = true;
    });
    int location;
    if (type == 'home')
      location = WallpaperManager.HOME_SCREEN;
    else if (type == 'lock')
      location = WallpaperManager.LOCK_SCREEN;
    else {
      location = WallpaperManager.BOTH_SCREENS;
    }
    File file = await DefaultCacheManager().getSingleFile(widget.url);
    // ignore: unused_local_variable
    String result =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Wallpapers>(context);
    final isFav = provider.containsFav(widget.url, widget.id);
    return _isLoading
        ? Center(
            child: Container(
                height: widget.deviceSize.height * 0.4,
                width: widget.deviceSize.width * 0.8,
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 5,
                )),
          )
        : Positioned(
            top: widget.deviceSize.height * 0.92,
            child: FadeTransition(
              opacity: _animOpacity,
              child: Container(
                alignment: Alignment.center,
                height: widget.deviceSize.height * 0.08,
                width: widget.deviceSize.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black12, Colors.black38])),
                child: Row(
                  children: [
                    SizedBox(
                      width: widget.deviceSize.width * 0.03,
                    ),
                    TextButton.icon(
                      onPressed: () async {
                        showMoadl(context, widget.deviceSize, _setWallpaper);
                      },
                      icon: Icon(
                        Icons.done,
                        color: Colors.white,
                        size: widget.deviceSize.width * 0.08,
                      ),
                      label: Text(
                        "Set As Wallpaper",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: widget.deviceSize.width * 0.05),
                      ),
                    ),
                    SizedBox(
                      width: widget.deviceSize.width * 0.28,
                    ),
                    IconButton(
                      onPressed: () {
                        if (isFav) {
                          return provider.deleteFav(
                              widget.url, widget.id, widget.user);
                        }
                        provider.setFav(widget.url, widget.id, widget.user);
                      },
                      icon: Icon(
                        isFav
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
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
