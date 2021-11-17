import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parasut_rover_flutter/core/extensions/context_extensions.dart';
import 'package:parasut_rover_flutter/entities/dto/photo.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageViewer extends StatelessWidget {
  final Photo photo;
  const ImageViewer({Key? key, required this.photo}) : super(key: key);

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
      child: Stack(
        children: [
          InteractiveViewer(
            child: FadeInImage.memoryNetwork(
              width: double.infinity,
              height: double.infinity,
              placeholder: kTransparentImage,
              image: photo.imgSrc!,
              fit: BoxFit.contain,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: buildInfoArea(context),
          )
        ],
      ),
    );
  }

  Container buildInfoArea(BuildContext context) {
    return Container(
      margin: context.paddingNormal,
      padding: context.paddingNormal,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            photo.camera?.fullName ?? "",
            style: TextStyle(
              fontSize: context.customWidthValue(0.04),
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: context.mediumWidthValue),
          SizedBox(
            width: double.infinity,
            child: Text(
              photo.earthDate ?? "-",
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
