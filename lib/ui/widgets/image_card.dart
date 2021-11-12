import 'package:flutter/material.dart';
import 'package:parasut_rover_flutter/core/extensions/context_extensions.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageCard extends StatelessWidget {
  final String source;
  final String? title;
  final String? date;
  const ImageCard({Key? key, required this.source, this.title, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Container(
        decoration: BoxDecoration(color: Color(0xFF36454F), borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: FadeInImage.memoryNetwork(
                width: double.infinity,
                placeholder: kTransparentImage,
                image: source,
                fit: BoxFit.cover,
              ),
            ),
            Visibility(
              visible: title != null,
              child: Expanded(
                child: Container(
                  padding: context.paddingNormal,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade300,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: context.mediumWidthValue),
                        width: double.infinity,
                        child: Text(
                          date ?? '',
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: context.customWidthValue(0.03)
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
