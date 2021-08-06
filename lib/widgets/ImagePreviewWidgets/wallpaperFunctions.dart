import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
import 'package:legacywallpapers/providers/wallpapers.dart';
import './modalSheet.dart';
import 'package:provider/provider.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:wallpaper_manager/wallpaper_manager.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:io';

// ignore: must_be_immutable
class FunctionsWidget extends StatefulWidget {
  final Size deviceSize;
  bool _showAppBar;
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
      widget._showAppBar = false;
    });

    _showSnackBar(result);
    await Future.delayed(Duration(seconds: 3), () {
      setState(() {
        widget._showAppBar = true;
      });
    });
  }

  _showSnackBar(String result) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          result,
          textAlign: TextAlign.center,
        ),
        animation: _animOpacity,
        duration: Duration(milliseconds: 2500),
        elevation: 5,
        backgroundColor: Colors.black54,
      ),
    );
  }

  Future<void> _downloadWallpaper() async {
    setState(() {
      widget._showAppBar = false;
    });
    _showSnackBar('Downloading Image');
    await Future.delayed(Duration(seconds: 3), () {
      setState(() {
        widget._showAppBar = true;
      });
    });
    File file = await DefaultCacheManager().getSingleFile(widget.url);
    final result = await ImageGallerySaver.saveFile(file.path);
    print(result);
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
        : widget._showAppBar
            ? FadeTransition(
                opacity: _animOpacity,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius:
                        BorderRadius.circular(widget.deviceSize.width * 0.05),
                  ),
                  margin: EdgeInsets.only(
                      top: widget.deviceSize.height * .9,
                      right: widget.deviceSize.width * 0.02,
                      left: widget.deviceSize.width * 0.02),
                  padding: EdgeInsets.symmetric(
                      horizontal: widget.deviceSize.width * 0.02),
                  alignment: Alignment.center,
                  height: widget.deviceSize.height * 0.08,
                  width: widget.deviceSize.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: widget.deviceSize.width * 0.4,
                        padding: EdgeInsets.all(widget.deviceSize.width * 0.01),
                        alignment: Alignment.centerLeft,
                        child: TextButton.icon(
                          onPressed: () async {
                            showMoadl(
                                context, widget.deviceSize, _setWallpaper);
                          },
                          icon: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: widget.deviceSize.width * 0.1,
                          ),
                          label: AutoSizeText(
                            "Set As",
                            maxLines: 1,
                            maxFontSize: 23,
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.white, fontSize: 70.sp),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: widget.deviceSize.width * 0.25,
                      ),
                      IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          _downloadWallpaper();
                        },
                        icon: Icon(
                          Icons.download_rounded,
                          color: Colors.white,
                          size: widget.deviceSize.width * 0.11,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.all(0),
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
                          size: widget.deviceSize.width * 0.11,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : SizedBox();
  }
}
