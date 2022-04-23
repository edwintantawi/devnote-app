import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class AppText extends StatelessWidget {
  final String text;

  const AppText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text).tr();
  }
}
