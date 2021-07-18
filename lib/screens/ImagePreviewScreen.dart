import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//widgets
import '../widgets/ImagePreviewWidgets/AnimiatedAppBar.dart';
import '../widgets/ImagePreviewWidgets/wallpaperFunctions.dart';

class ImagePreviewScreen extends StatefulWidget {
  static const name = 'imagePreviewScreen';

  ImagePreviewScreen();

  @override
  _ImagePreviewScreenState createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
  final _transCont = TransformationController();
  bool _showAppBar = true;
  bool _firstBuild = true;
  @override
  void initState() {
    if (_firstBuild)
      SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    _firstBuild = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final url = args["url"];
    final bool isFav = args['isFav'];

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
                  },
                );
              } else {
                _transCont.value = Matrix4.identity()
                  ..translate(0.0, -60.0)
                  ..scale(1.2);
                setState(() {
                  _showAppBar = false;
                });
              }
            },
            child: InteractiveViewer(
              boundaryMargin: EdgeInsets.all(0),
              transformationController: _transCont,
              child: Container(
                height: deviceSize.height,
                width: deviceSize.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(url!),
                  ),
                ),
              ),
            ),
          ),
          AnimatedAppBar(_showAppBar),
          FunctionsWidget(deviceSize, _showAppBar, url, isFav),
        ],
      ),
    );
  }
}
