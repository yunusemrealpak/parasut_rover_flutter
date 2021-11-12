import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme_controller.dart';

class ThemeBuilder extends StatefulWidget {
  final Widget Function(BuildContext context, ThemeController model, Widget? child) builder;
  ThemeBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  _ThemeBuilderState createState() => _ThemeBuilderState();
}

class _ThemeBuilderState extends State<ThemeBuilder> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeController(),
      child: Consumer(builder: widget.builder),
    );
  }
}
