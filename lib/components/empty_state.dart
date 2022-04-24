import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.inventory,
          size: 80,
          color: Colors.grey[300],
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 250,
          child: Text(
            'TR_EMPTY_STATE',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[300],
            ),
          ).tr(),
        ),
      ],
    );
  }
}
