import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:devnote/providers/editor_provider.dart';
import 'package:devnote/screens/editor_screen.dart';

class AddNoteFAB extends StatelessWidget {
  const AddNoteFAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editorProvider = Provider.of<EditorProvider>(context, listen: false);

    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.add),
      onPressed: () {
        editorProvider.clearEditor();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EditorScreen(
              title: 'TR_CREATE_NOTE'.tr(),
            ),
          ),
        );
      },
    );
  }
}
