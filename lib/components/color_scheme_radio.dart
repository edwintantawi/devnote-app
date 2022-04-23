import 'package:flutter/material.dart';

class ColorSchemeRadio extends StatelessWidget {
  final Color color;
  final String name;
  final int index;
  final int currentIndex;
  final Function(int?) onChange;

  const ColorSchemeRadio({
    Key? key,
    required this.color,
    required this.name,
    required this.index,
    required this.currentIndex,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        unselectedWidgetColor: color,
      ),
      child: RadioListTile(
        title: Text(name),
        activeColor: color,
        value: index,
        groupValue: currentIndex,
        onChanged: onChange,
      ),
    );
  }
}
