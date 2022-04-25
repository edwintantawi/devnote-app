import 'package:devnote/models/note_model.dart';
import 'package:devnote/providers/note_provider.dart';
import 'package:flutter/material.dart';

import 'package:devnote/components/bookmark_icon.dart';
import 'package:provider/provider.dart';

class ToggleBookmarkIconButton extends StatelessWidget {
  final NoteModel note;

  const ToggleBookmarkIconButton({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);

    return GestureDetector(
      onTap: () {
        noteProvider.toggleNoteToBookmark(note.id);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        padding: const EdgeInsets.all(6),
        child: BookmarkIcon(isBookmarked: note.isBookmarked),
      ),
    );
  }
}
