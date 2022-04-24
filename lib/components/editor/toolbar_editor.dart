import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:devnote/providers/editor_provider.dart';

class ToolbarEditor extends StatelessWidget {
  const ToolbarEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editorProvider = Provider.of<EditorProvider>(context);

    return QuillToolbar.basic(
      toolbarIconSize: 22,
      locale: context.locale,
      controller: editorProvider.editorController,
      showImageButton: false,
      showVideoButton: false,
      showCameraButton: false,
      showDividers: true,
      multiRowsDisplay: false,
    );
  }
}
