import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String description;
  final IconData icon;

  const EmptyState({
    Key? key,
    required this.description,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80, color: Colors.grey[300]),
        const SizedBox(height: 8),
        SizedBox(
          width: 250,
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[300]),
          ),
        ),
      ],
    );
  }
}
