import 'package:flutter/material.dart';

enum InputType { title, description }

class InputEditor extends StatelessWidget {
  final TextEditingController? controller;
  final InputType type;
  final String? hintText;

  const InputEditor({
    Key? key,
    required this.type,
    this.controller,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isTitle = type == InputType.title;

    return TextField(
      style: TextStyle(
        fontSize: isTitle ? 24 : 14,
        fontWeight: isTitle ? FontWeight.w500 : FontWeight.normal,
        color: isTitle ? Colors.black : Colors.grey,
      ),
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 2, bottom: 8),
        isCollapsed: true,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[400]),
        border: InputBorder.none,
      ),
    );
  }
}
