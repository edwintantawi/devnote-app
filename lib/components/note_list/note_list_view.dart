import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:devnote/components/note_list/note_list_tile.dart';
import 'package:devnote/models/note_model.dart';
import 'package:devnote/providers/note_provider.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);

    return ListView.separated(
      padding: const EdgeInsets.only(top: 8, bottom: 80),
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(thickness: 1);
      },
      itemCount: noteProvider.notes.length,
      itemBuilder: (BuildContext context, int index) {
        NoteModel note = noteProvider.notes[index];

        return NoteListTile(note: note);
      },
    );
  }
}
