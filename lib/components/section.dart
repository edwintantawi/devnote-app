import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final String title;
  final Widget? child;

  const Section({
    Key? key,
    required this.title,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 24,
            bottom: 0,
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[400],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          child: child,
        )
      ],
    );
  }
}
