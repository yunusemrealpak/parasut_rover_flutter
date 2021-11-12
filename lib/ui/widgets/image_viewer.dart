import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageViewer extends StatelessWidget {
  final String url;
  const ImageViewer({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.transparent,
        leading: CupertinoButton(
          child: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      child: InteractiveViewer(
        child: FadeInImage.memoryNetwork(
          width: double.infinity,
          height: double.infinity,
          placeholder: kTransparentImage,
          image: url,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
