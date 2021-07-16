import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImagePreviewScreen extends StatefulWidget {
  static const name = 'imagePreviewScreen';

  ImagePreviewScreen();

  @override
  _ImagePreviewScreenState createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen>
    with TickerProviderStateMixin {
  final _transCont = TransformationController();
  bool _showAppBar = true;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final url = args["url"];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          GestureDetector(
            onDoubleTap: () {
              if (_transCont.value != Matrix4.identity()) {
                _transCont.value = Matrix4.identity();
                setState(
                  () {
                    _showAppBar = true;
                    SystemChrome.setEnabledSystemUIOverlays(
                        SystemUiOverlay.values);
                  },
                );
              } else {
                _transCont.value = Matrix4.identity()
                  ..translate(0.0, -60.0)
                  ..scale(1.2);
                setState(() {
                  _showAppBar = false;
                  SystemChrome.setEnabledSystemUIOverlays(
                      [SystemUiOverlay.bottom]);
                });
              }
            },
            child: InteractiveViewer(
              transformationController: _transCont,
              constrained: true,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(url!),
                  ),
                ),
              ),
            ),
          ),
          AnimatedSize(
            duration: Duration(milliseconds: 200),
            vsync: this,
            curve: Curves.easeInExpo,
            child: Container(
              child: Container(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    size: _showAppBar ? deviceSize.width * 0.08 : 0.0,
                    color: Colors.white,
                  ),
                ),
                color: Colors.black26,
                width: _showAppBar ? deviceSize.width : 0.0,
                height: deviceSize.height * 0.12,
              ),
            ),
          )
        ],
      ),
    );
  }
}
