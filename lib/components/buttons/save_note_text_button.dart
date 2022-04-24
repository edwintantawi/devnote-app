import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:devnote/models/note_model.dart';
import 'package:devnote/providers/editor_provider.dart';
import 'package:devnote/providers/note_provider.dart';

class SaveNoteTextButton extends StatelessWidget {
  final String? noteId;

  const SaveNoteTextButton({Key? key, this.noteId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editorProvider = Provider.of<EditorProvider>(context);
    final noteProvider = Provider.of<NoteProvider>(context);

    void addOrUpdateNoteHandler() {
      Uuid uuid = const Uuid();

      NoteModel newNote = NoteModel(
        id: noteId ?? uuid.v4(),
        title: editorProvider.titleController.text,
        description: editorProvider.descriptionController.text,
        data: editorProvider.editorController.document.toDelta(),
      );

      if (noteId == null) {
        noteProvider.addNote(newNote);
      } else {
        noteProvider.updateNote(newNote);
      }

      Navigator.pop(context);
    }

    return TextButton(
      child: Text(
        'TR_SAVE'.tr(),
        style: const TextStyle(color: Colors.white),
      ),
      onPressed: addOrUpdateNoteHandler,
    );
  }
}
