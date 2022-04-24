import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tuple/tuple.dart';

import 'package:devnote/providers/editor_provider.dart';

class TextEditor extends StatelessWidget {
  const TextEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editorProvider = Provider.of<EditorProvider>(context);

    final focusNode = FocusNode();

    return QuillEditor(
      controller: editorProvider.editorController,
      scrollController: ScrollController(),
      scrollable: true,
      focusNode: focusNode,
      autoFocus: false,
      readOnly: false,
      placeholder: 'TR_NOTE'.tr(),
      expands: false,
      padding: EdgeInsets.zero,
      customStyles: DefaultStyles(
        placeHolder: DefaultTextBlockStyle(
          TextStyle(fontSize: 14, color: Colors.grey[400]),
          const Tuple2(0, 0),
          const Tuple2(0, 0),
          null,
        ),
      ),
    );
  }
}
