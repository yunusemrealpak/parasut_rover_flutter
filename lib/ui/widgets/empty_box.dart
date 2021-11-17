
import 'package:flutter/material.dart';
import 'package:parasut_rover_flutter/core/extensions/context_extensions.dart';

class EmptyBox extends StatelessWidget {
  const EmptyBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.mediumWidthValue,
    );
  }
}