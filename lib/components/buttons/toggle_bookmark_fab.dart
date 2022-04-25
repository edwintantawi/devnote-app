import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:devnote/components/bookmark_icon.dart';
import 'package:devnote/models/note_model.dart';
import 'package:devnote/providers/note_provider.dart';

class ToggleBookmarkFAB extends StatelessWidget {
  final NoteModel note;

  const ToggleBookmarkFAB({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 44),
      child: FloatingActionButton(
        elevation: 0,
        child: BookmarkIcon(isBookmarked: note.isBookmarked),
        onPressed: () {
          noteProvider.toggleNoteToBookmark(note.id);
        },
      ),
    );
  }
}
