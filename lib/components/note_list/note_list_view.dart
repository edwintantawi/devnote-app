import 'package:flutter/material.dart';

import 'package:devnote/components/note_list/note_list_tile.dart';
import 'package:devnote/models/note_model.dart';

class NoteListView extends StatelessWidget {
  final List<NoteModel> notes;

  const NoteListView({
    Key? key,
    required this.notes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 8, bottom: 80),
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(thickness: 1);
      },
      itemCount: notes.length,
      itemBuilder: (BuildContext context, int index) {
        return NoteListTile(note: notes[index]);
      },
    );
  }
}
