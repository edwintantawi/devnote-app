import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:uuid/uuid.dart';

import 'package:devnote/components/editor/toolbar_editor.dart';
import 'package:devnote/models/note_model.dart';
import 'package:devnote/providers/editor_provider.dart';
import 'package:devnote/providers/note_provider.dart';
import 'package:devnote/components/editor/text_editor.dart';
import 'package:devnote/components/app_shell.dart';

class EditorScreen extends StatelessWidget {
  final NoteModel? note;
  final String? title;

  const EditorScreen({Key? key, this.title, this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editorProvider = Provider.of<EditorProvider>(context);
    final noteProvider = Provider.of<NoteProvider>(context);

    return AppShell(
      title: Text(title ?? 'TR_CREATE_NOTE').tr(),
      actions: [
        note?.id != null
            ? IconButton(
                icon: const Icon(Icons.delete_forever),
                onPressed: () {
                  noteProvider.deleteNote(note?.id);
                  Navigator.pop(context);
                },
              )
            : const SizedBox.shrink(),
        TextButton(
          child: const Text(
            'TR_SAVE',
            style: TextStyle(color: Colors.white),
          ).tr(),
          onPressed: () {
            Uuid uuid = const Uuid();

            NoteModel newNote = NoteModel(
              id: note?.id ?? uuid.v4(),
              title: editorProvider.titleController.text,
              description: editorProvider.descriptionController.text,
              data: editorProvider.editorController.document.toDelta(),
            );

            if (note?.id == null) {
              noteProvider.addNote(newNote);
            } else {
              noteProvider.updateNote(newNote);
            }

            Navigator.pop(context);
          },
        ),
      ],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Column(
              children: [
                TextField(
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  controller: editorProvider.titleController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    isCollapsed: true,
                    hintText: 'TR_TITLE'.tr(),
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    border: InputBorder.none,
                  ),
                ),
                TextField(
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                  controller: editorProvider.descriptionController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 2, bottom: 8),
                    isCollapsed: true,
                    hintText: 'TR_DESCRIPTION'.tr(),
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    border: InputBorder.none,
                  ),
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
