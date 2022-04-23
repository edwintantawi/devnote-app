import 'package:flutter/material.dart';

class AppShell extends StatelessWidget {
  final Widget? title;
  final Widget? body;
  final Widget? fab;
  final List<Widget>? actions;

  const AppShell({
    Key? key,
    this.title,
    this.actions,
    this.body,
    this.fab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: title,
        actions: actions,
      ),
      body: body,
      floatingActionButton: fab,
    );
  }
}
