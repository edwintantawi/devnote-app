import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:devnote/providers/note_provider.dart';

class DeleteNoteIconButton extends StatelessWidget {
  final String noteId;

  const DeleteNoteIconButton({
    Key? key,
    required this.noteId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);

    return IconButton(
      icon: const Icon(Icons.delete_forever),
      onPressed: () {
        noteProvider.deleteNote(noteId);
        Navigator.pop(context);
      },
    );
  }
}
