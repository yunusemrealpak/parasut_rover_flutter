import 'package:flutter/material.dart';
import 'package:parasut_rover_flutter/core/extensions/context_extensions.dart';

class SelectableBorderBox extends StatefulWidget {
  final bool? selected;
  final String label;
  final VoidCallback? onSelected;
  const SelectableBorderBox({Key? key, required this.label, this.onSelected, this.selected = false}) : super(key: key);

  @override
  State<SelectableBorderBox> createState() => _SelectableBorderBoxState();
}

class _SelectableBorderBoxState extends State<SelectableBorderBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onSelected,
      child: Container(
        padding: context.paddingLow,
        decoration: BoxDecoration(
          color: widget.selected! ? context.cupertinoTheme.primaryColor : Colors.transparent,
          border: Border.all(color: widget.selected! ? context.cupertinoTheme.primaryColor : Colors.white),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
