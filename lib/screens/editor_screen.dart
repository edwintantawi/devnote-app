import 'package:devnote/components/buttons/delete_note_icon_button.dart';
import 'package:devnote/components/buttons/save_note_text_button.dart';
import 'package:devnote/components/editor/input_editor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:devnote/components/editor/toolbar_editor.dart';
import 'package:devnote/models/note_model.dart';
import 'package:devnote/providers/editor_provider.dart';
import 'package:devnote/providers/note_provider.dart';
import 'package:devnote/components/editor/text_editor.dart';
import 'package:devnote/components/app_shell.dart';

class EditorScreen extends StatelessWidget {
  final NoteModel? note;
  final String title;

  const EditorScreen({Key? key, required this.title, this.note})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editorProvider = Provider.of<EditorProvider>(context);

    return AppShell(
      title: Text(title),
      actions: [
        note?.id != null
            ? DeleteNoteIconButton(
                noteId: note?.id,
              )
            : const SizedBox.shrink(),
        SaveNoteTextButton(noteId: note?.id),
      ],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            child: Column(
              children: [
                InputEditor(
                  type: InputType.title,
                  hintText: 'TR_TITLE'.tr(),
                  controller: editorProvider.titleController,
                ),
                InputEditor(
                  type: InputType.description,
                  hintText: 'TR_DESCRIPTION'.tr(),
                  controller: editorProvider.descriptionController,
                ),
                const Divider(thickness: 1),
              ],
            ),
          ),
          Expanded(
            flex: 15,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const TextEditor(),
            ),
          ),
          const ToolbarEditor()
        ],
      ),
    );
  }
}
